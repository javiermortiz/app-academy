
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    if (htmlElement.children) {
        Array.from(htmlElement.children).forEach(child => {
            htmlElement.removeChild(child);
        })
    }
    const pTag = document.createElement("p");
    const newContent = document.createTextNode(string)
    pTag.appendChild(newContent);
    htmlElement.appendChild(pTag);
};

htmlGenerator('Party Time.', partyHeader);