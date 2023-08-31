/**
 * 
 */
const itemContainer = document.getElementById("itemsContainer");
const itemElements = itemContainer.children;
const items = Array.from(itemElements);


const filterDropdown = document.getElementById('filter');
const itemCards = document.querySelectorAll('.itemCards'); // This is the container of item cards

// to create a delay when user filters
let delayTime;

const filterInput = document.getElementById('filterInput');
    

    filterInput.addEventListener('input', function(event) {
		event.preventDefault(); // Prevent page scroll
        const filterText = this.value.toLowerCase().trim();
		
		// creates a little delay
	clearTimeout(delayTime);
	delayTime = setTimeout(()=>{
        itemCards.forEach(card => {
            const itemName = card.querySelector('.card-text').textContent.toLowerCase();
            if (itemName.includes(filterText)) {
                card.style.display = 'block'; // Show the card
            } else {
                card.style.display = 'none'; // Hide the card
            }
        });
        },400);
    });
 


filterDropdown.addEventListener('change', function() {
	
	const selectedFilter = this.value;
	
	// Sort and display items based on the selected filter
	if (selectedFilter === 'highestPrice') {
		sortAndDisplayItemsByPrice('desc');
	} else if (selectedFilter === 'lowestPrice') {
		sortAndDisplayItemsByPrice('asc');
	} else if (selectedFilter === 'highestRated') {
		sortAndDisplayItemsByRating('desc');
	} else if (selectedFilter === 'lowestRated') {
		sortAndDisplayItemsByRating('asc');
	} else {
		// If no filter selected, reset to default display
		resetItemsDisplay();
	}
});


const sortAndDisplayItemsByPrice = (order) => {
	// creates a little delay
	clearTimeout(delayTime);
	delayTime = setTimeout(()=>{
		
	if (order === "desc") {
		items.sort((a, b) => b.getAttribute("data-price") - a.getAttribute("data-price"));
		items.forEach(item=> itemContainer.appendChild(item));
	} else {
		items.sort((a, b) => a.getAttribute("data-price") - b.getAttribute("data-price"));
		items.forEach(item=> itemContainer.appendChild(item));
	}
	
	},300);
	
}

const sortAndDisplayItemsByRating = (order) => {
	// creates a little delay
	clearTimeout(delayTime);
	delayTime = setTimeout(()=>{
	
	if(order === "desc"){
		
		items.sort((a, b) => b.getAttribute("data-rating") - a.getAttribute("data-rating"));
		items.forEach(item=> itemContainer.appendChild(item));
	} else {
		
		items.sort((a, b) => a.getAttribute("data-rating") - b.getAttribute("data-rating"));
		items.forEach(item=> itemContainer.appendChild(item));
	}
	},300);
}

function resetItemsDisplay() {
	// Reset items display to default order
	console.log("no change")
}

