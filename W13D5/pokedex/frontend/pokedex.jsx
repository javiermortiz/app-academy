import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon } from './actions/pokemon_actions';
import configureStore from './store/store'

document.addEventListener("DOMContentLoaded", () => {
  const rootEl = document.getElementById('root');
  const Pokedex = () => {
      return <h1>Pokedex</h1>
  };
  const store = configureStore();

  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Pokedex />, rootEl);
});
