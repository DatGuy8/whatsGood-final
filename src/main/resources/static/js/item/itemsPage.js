/**
 * 
 */
const itemContainer = document.getElementById("itemsContainer");
const itemElements = itemContainer.children;
const items = Array.from(itemElements);


const filterDropdown = document.getElementById('filter');
const itemCards = document.querySelectorAll('.itemCards'); // This is the container of item cards

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
	if (order === "desc") {
		items.sort((a, b) => b.getAttribute("data-price") - a.getAttribute("data-price"));
		items.forEach(item=> itemContainer.appendChild(item));
	} else {
		items.sort((a, b) => a.getAttribute("data-price") - b.getAttribute("data-price"));
		items.forEach(item=> itemContainer.appendChild(item));
	}
	
}

const sortAndDisplayItemsByRating = (order) => {
	if(order === "desc"){
		
		items.sort((a, b) => b.getAttribute("data-rating") - a.getAttribute("data-rating"));
		items.forEach(item=> itemContainer.appendChild(item));
	} else {
		
		items.sort((a, b) => a.getAttribute("data-rating") - b.getAttribute("data-rating"));
		items.forEach(item=> itemContainer.appendChild(item));
	}
	
}

function resetItemsDisplay() {
	// Reset items display to default order
	console.log("no change")
}