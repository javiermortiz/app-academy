import React from 'react';

class Weather extends React.Component {
    constructor(props) {
        super(props);
        this.state = {};
        this.pollWeather = this.pollWeather.bind(this);
    }

componentDidMount() {


    const location = navigator.geolocation.getCurrentPosition((pos) => {
        const crds = pos.coords;
        const lat = crds.latitude;
        const long = crds.longitude;
        // console.log(location);
        this.pollWeather(lat, long);
    });
  
}

pollWeather(lat, lon) {
    let url = `http://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}`;

    const apiKey = '48f1b7532bebb947e6c5733106ef4447';
    // This is our API key; please use your own!
    url += `&APPID=${apiKey}`;

    const xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = () => {
        //ready state of DONE means this is complete
        if (xmlhttp.status === 200 && xmlhttp.readyState === XMLHttpRequest.DONE) {
            const data = JSON.parse(xmlhttp.responseText);
            const degreesTag = document.querySelector('.degrees');
            const city = data.name;
            const fahrenheit = (data.main.temp - 273.15) * 1.8 + 32;
            // degreesTag.innerHTML = `The weather in ${city} is ${fahrenheit.toFixed(1)} F`;
        }
    };
    debugger
    xmlhttp.open('GET', url, true);
    xmlhttp.send();
};

render() {
    if (!this.state.weather) {
        return <h1>Loading...</h1>
    } else {
        return <div>{this.state.weather}</div> 
    }
 
}

}


export default Weather;


//find the user's location
// const getWeather = function () {
//     if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition((position) => {
//             const lat = position.coords.latitude;
//             const long = position.coords.longitude;
//             pollWeather(lat, long);
//         });
//     }
//     else {
//         window.alert("Could not get location");
//     }
// };



// getWeather();