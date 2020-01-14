import ReactDOM from 'react-dom';
import React from 'react';
import Clock from './frontend/clock';
import Tabs from './frontend/tabs';
import Weather from './frontend/weather'

function Root () {
    const arr = [{title: "One", content: "I am the first"}, {title: "Two", content: "I am the second"}, {title: "three", content: "I am the third"}];
    return (
    <div>
        <div className="clock"><Clock /></div> 
        <div><Tabs data={ arr }/></div>
        <div><Weather /></div>
    </div> )
}

document.addEventListener("DOMContentLoaded", () => {
    const main = document.getElementById("main");
    ReactDOM.render(<Root />, main);
})