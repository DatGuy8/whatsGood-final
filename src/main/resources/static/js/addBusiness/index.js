let autocomplete;
let businessName;
let street;
let zipCode;
let state;

function initAutocomplete() {
	businessName = document.querySelector('#businessName');


	autocomplete = new google.maps.places.Autocomplete(
		businessName,
		{
			types: ['establishment'],
			componentRestrictions: { 'country': ['us'] },
			fields: ['address_components', 'geometry', 'name', 'formatted_address']
		});

	businessName.focus();

	autocomplete.addListener('place_changed', onPlaceChanged);

}


function onPlaceChanged() {
	const place = autocomplete.getPlace();
	console.log(place);
	let address1 = "";
	let postcode = "";
	for (const component of place.address_components) {
		//@ts-ignore
		const componentType = component.types[0];

		switch (componentType) {
			case "street_number": {
				address1 = `${component.long_name} ${address1}`;
				break;
			}

			case "route": {
				address1 += component.short_name;
				break;
			}

			case "postal_code": {
				postcode = `${component.long_name}${postcode}`;
				break;
			}

			case "postal_code_suffix": {
				postcode = `${postcode}-${component.long_name}`;
				break;
			}
			case "locality":
				document.querySelector("#city").value = component.long_name;
				break;
			case "administrative_area_level_1": {
				document.querySelector("#state").value = component.short_name;
				break;
			}
		}

	}
	
	document.querySelector("#street").value = address1;
	document.querySelector("#zipCode").value = postcode;
	document.querySelector("#businessName").value = place.name;
	document.querySelector("#website").focus();
}


function previewImage(event) {
	var reader = new FileReader();
	reader.onload = function() {
		var output = document.getElementById('imagePreview');
		output.src = reader.result;
		output.style.display = 'block';
	};
	reader.readAsDataURL(event.target.files[0]);
}
