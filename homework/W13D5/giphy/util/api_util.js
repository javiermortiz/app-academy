export const fetchSearchGiphys = (searchTerm) => {
    return $.ajax({
        type: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=EPqBoH7cu77VuIaWXalncm14DfheBuxo&limit=2`
    })
};

// window.fetchSearchGiphys = fetchSearchGiphys;