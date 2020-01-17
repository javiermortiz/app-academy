import configureStore from './store/store';
import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

const store = configureStore()
window.store = store;

document.addEventListener("DOMContentLoaded", () => {
    const rootElement = document.querySelector("#content");
    ReactDOM.render(<Root store= { store } />, rootElement);
})
