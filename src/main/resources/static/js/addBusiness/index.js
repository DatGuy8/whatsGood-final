
function initializeAutocomplete() {
	var input = document.getElementById('address');
	var options = {
		types: ['address'] // Restrict suggestions to addresses
	};
	var autocomplete = new google.maps.places.Autocomplete(input, options);
}
window.addEventListener('load', initializeAutocomplete);


function previewImage(event) {
	var reader = new FileReader();
	reader.onload = function() {
		var output = document.getElementById('imagePreview');
		output.src = reader.result;
		output.style.display = 'block';
	};
	reader.readAsDataURL(event.target.files[0]);
}
