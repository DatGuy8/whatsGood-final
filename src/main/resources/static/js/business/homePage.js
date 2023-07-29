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

filterInput.addEventListener('input', function(event){
	const filterText = this.value.toLowerCase().trim();
	
	businessCards.forEach(card=>{
		const businessName = card.querySelector('.card-text').textContent.toLowerCase();
		if(businessName.includes(filterText)){
			card.style.display = 'block';
			
		}
		else{
			card.style.display = 'none';
		}
	})
	
})