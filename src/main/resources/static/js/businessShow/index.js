/**
 * 
 */
 let delayTime;
 
 
 const filterInput = document.getElementById('filterInput');
    const itemCards = document.querySelectorAll('.item-card');

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
 



