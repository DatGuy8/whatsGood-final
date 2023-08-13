/**
 * 
 */

function toggleDropdown() {
  var dropdownMenu = document.getElementById("dropdownMenu");
  if (dropdownMenu.style.display === "none") {
    dropdownMenu.style.display = "block";
  } else {
    dropdownMenu.style.display = "none";
  }
}

function validateSearchForm() {
    var searchInput = document.getElementsByName("searchParams")[0].value;
    if (searchInput.length < 3) {
        alert("Search input should have at least 3 characters.");
        return false; // Prevent form submission
    }
    return true; // Allow form submission
}

function addPhotoForm() {
	let form  = document.getElementById("addPhotoInput");
	if (form.style.display === "none") {
		form.style.display = "block";
	} else {
		form.style.display = " none";
	}
}

