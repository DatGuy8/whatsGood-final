

// Admin Business filter select
$(document).ready(function() {
	$('#filterSelect').change(function() {
		let filterValue = $(this).val();


		if (filterValue === 'all') {
			$('#businessTable tbody tr').show();
		}

		else {
			$('#businessTable tbody tr').each(function() {
				let approvedValue = $(this).find('td:nth-child(5)').text().trim().toLowerCase();
				let featuredValue = $(this).find('td:nth-child(4)').text().trim().toLowerCase();
				if ((filterValue === "true" && approvedValue === 'true') || (filterValue === "false" && approvedValue === 'false') || (filterValue === "featured" && featuredValue === "true") || (filterValue === "notFeatured" && featuredValue === "false")) {
					$(this).show();
				}
				else {
					$(this).hide();
				}
			});
		}
	});
});

// Admin Users Button select
$(document).ready(function() {
	$('#filterSelectUsers').change(function() {
		let filterValue = $(this).val();


		if (filterValue === 'all') {
			$('#businessTable tbody tr').show();
		}

		else {
			$('#businessTable tbody tr').each(function() {
				let role = $(this).find('td:nth-child(4)').text();
				if ((filterValue === role)) {
					$(this).show();
				}
				else {
					$(this).hide();
				}
			});
		}
	});
});

// Admin Items Input Filter

const filterInput = document.getElementById('filterInput');
const allItems = document.querySelectorAll('.itemRow');

filterInput.addEventListener('input', function(event) {
	event.preventDefault(); // Prevent page scroll
	const filterText = this.value.toLowerCase().trim();

	allItems.forEach(item => {
		const itemName = item.querySelector('.searchDes').textContent.toLowerCase();
		if (itemName.includes(filterText)) {
			item.style.display = ''; // Show the card
		} else {
			item.style.display = 'none'; // Hide the card
		}
	});
});
