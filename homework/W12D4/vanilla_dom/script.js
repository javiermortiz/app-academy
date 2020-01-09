document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const addPlaces = (e) => {
    e.preventDefault();
    debugger
    const favoriteInputEl = document.querySelector(".favorite-input");
    const favoriteInput = favoriteInputEl.value;
    favoriteInputEl.value = "";
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = favoriteInput;
    ul.appendChild(li);
    }

  const favoriteSubmitEl = document.querySelector(".favorite-submit");
  favoriteSubmitEl.addEventListener("click", addPlaces);


  // adding new photos

  // --- your code here!

  const toggleForm = (e) => {
    e.preventDefault();
    const formContainer = document.querySelector(".photo-form-container");
    if (formContainer.className === "photo-form-container hidden") {
      formContainer.className = "photo-form-container";
    } else {
      formContainer.className = "photo-form-container hidden";
    }
  }

  const toggleButton = document.querySelector(".photo-show-button");
  toggleButton.addEventListener("click", toggleForm);

  const handlePhotoSubmit = (e) => {
    e.preventDefault();

    const photoUrlInput = document.querySelector(".photo-url-input");
    const photoUrl = photoUrlInput.value;
    photoUrlInput.value = "";

    const newImg = document.createElement("img");
    newImg.src = photoUrl;

    const newPhotoLi = document.createElement("li");
    newPhotoLi.appendChild(newImg);

    const dogPhotosList = document.querySelector(".dog-photos");
    dogPhotosList.appendChild(newPhotoLi);
  };

  const photoSubmitButton = document.querySelector(".photo-url-submit");
  photoSubmitButton.addEventListener("click", handlePhotoSubmit);
});
