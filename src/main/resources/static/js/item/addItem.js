/**
 * 
 */
function previewImages(event) {
  const previewContainer = document.getElementById('imagePreviewContainer');
  previewContainer.innerHTML = ''; // Clear previous previews

  const files = event.target.files;
  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    const reader = new FileReader();

    reader.onload = function () {
      const img = document.createElement('img');
      img.src = reader.result;
      img.classList.add('preview-image');
      previewContainer.appendChild(img);
    }

    reader.readAsDataURL(file);
  }
}

