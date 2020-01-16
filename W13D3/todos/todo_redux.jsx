import configureStore from './frontend/store/store';
import React from 'react';
import ReactDOM from 'react-dom';
import Root from './frontend/components/root';

const store = configureStore()
window.store = store;

document.addEventListener("DOMContentLoaded", () => {
    const rootElement = document.querySelector(".root");
    ReactDOM.render(<Root store= { store } />, rootElement);
})
