/**
 * 
 */

// Initialize and add the map
let map, infoWindow, directionsService, directionsRenderer;

async function initMap() {
	// The location of Business
	const position = { lat: latitude, lng: longitude };
	// Request needed libraries.

	//@ts-ignore
	const { Map } = await google.maps.importLibrary("maps");
	const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

	// The map, centered on business location
	map = new Map(document.getElementById("map"), {
		zoom: 12,
		center: position,
		mapId: "businessLocation",
	});

	// The marker
	const marker = new AdvancedMarkerElement({
		map: map,
		position: position,
		title: "location of business",
	});

	infoWindow = new google.maps.InfoWindow();
	const locationButton = document.createElement("button");
	locationButton.textContent = "See Route from Your location";
	locationButton.classList.add("custom-map-control-button");
	map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
	locationButton.addEventListener("click", () => {
		// Try HTML5 geolocation.
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(
				(position) => {
					const pos = {
						lat: position.coords.latitude,
						lng: position.coords.longitude,
					};

					infoWindow.setPosition(pos);
					infoWindow.setContent("You");
					infoWindow.open(map);
					map.setCenter(pos);
					
					calculateAndDisplayRoute(pos, { lat: latitude, lng: longitude });
				},
				() => {
					handleLocationError(true, infoWindow, map.getCenter());
				}
			);
		} else {
			// Browser doesn't support Geolocation
			handleLocationError(false, infoWindow, map.getCenter());
		}
	});

	// Initialize the Directions Service and Directions Renderer
	directionsService = new google.maps.DirectionsService();
	directionsRenderer = new google.maps.DirectionsRenderer({
		map: map,
	});

}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
	infoWindow.setPosition(pos);
	infoWindow.setContent(
		browserHasGeolocation
			? "Error: The Geolocation service failed."
			: "Error: Your browser doesn't support geolocation."
	);
	infoWindow.open(map);
}

function calculateAndDisplayRoute(origin, destination) {
  directionsService.route(
    {
      origin: origin,
      destination: destination,
      travelMode: google.maps.TravelMode.DRIVING,
    },
    (response, status) => {
      if (status === "OK") {
        directionsRenderer.setDirections(response);
      } else {
        window.alert("Directions request failed due to " + status);
      }
    }
  );
}

window.initMap = initMap();


$(document).ready(function() {
	$('#getDirections').click(function() {
		var origin = "Current Location"; // or retrieve the user's current location
		var destination = { lat: latitude, lng: longitude };

		var url = "https://www.google.com/maps/dir/?api=1&origin=" + encodeURIComponent(origin) + "&destination=" + encodeURIComponent(destination.lat + "," + destination.lng);

		// Open the Google Maps Directions in a new tab/window
		window.open(url);
	});
});