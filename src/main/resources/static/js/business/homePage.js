/**
 * 
 */

//SORT BY HIGHEST AVERAGE RATING ON HOMEPAGE
const sortHighestBusiness = () => {

	const businessCard = document.getElementById("businessContainer");

	const businessElements = businessCard.children;

	const businesses = Array.from(businessElements);

	businesses.sort((a, b) => b.getAttribute("data-rating") - a.getAttribute("data-rating"));

	businesses.forEach(business => businessCard.appendChild(business));
}


// FILTER BUSINESS BY BUSINESS NAME
const filterInput = document.getElementById('filterInput');
const businessCards = document.querySelectorAll('.businessCards');
const noResultsMessage = document.getElementById("noResultsMessage");

filterInput.addEventListener('input', function(){
	const filterText = this.value.toLowerCase().trim();
	
	let matchingResults = 0; // Initialize a counter for matching results
	
	businessCards.forEach(card=>{
		const businessName = card.querySelector('.card-text').textContent.toLowerCase();
		if(businessName.includes(filterText)){
			card.style.display = 'block';
			matchingResults++;
		}
		else{
			card.style.display = 'none';
		}
	})
	
	if (matchingResults === 0) {
		noResultsMessage.style.display = 'block'; // Display the message
	} else {
		noResultsMessage.style.display = 'none'; // Hide the message
	}
	
})