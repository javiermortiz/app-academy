
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator (dogs) {
  const lis = [];
  const dogNames = Object.keys(dogs);
  dogNames.forEach(dog => {
    const aTag = document.createElement("a");
    aTag.innerHTML = dog;
    aTag.setAttribute("href", dogs[dog]);
    const liTag = document.createElement("li");
    liTag.classList.add("dog-link");
    liTag.classList.add("hide-dog-link");
    liTag.appendChild(aTag);
    lis.push(liTag);
  })
  return lis;
};

function attachDogLinks () {
  const dogLinks = dogLinkCreator(dogs);
  const ulTag = document.querySelectorAll(".drop-down-dog-list")[0];
  dogLinks.forEach(link => {
    ulTag.appendChild(link);
  })
};

function handleEnter () {
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(link => link.classList.remove("hide-dog-link"));
};

function handleLeave () {
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach(link => link.classList.add("hide-dog-link"));
};

const nav = document.querySelectorAll(".drop-down-dog-nav")[0];
nav.addEventListener("mouseenter", handleEnter);
nav.addEventListener("mouseleave", handleLeave);
attachDogLinks();