import ReactDOM from 'react-dom';
import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

function Root () {
    return <div>
    <div><Clock/></div>
    <div><Tabs/></div>
    </div>
};

document.addEventListener("DOMContentLoaded", () => {
    ReactDOM.render(<Root />, document.getElementById("main"));
});