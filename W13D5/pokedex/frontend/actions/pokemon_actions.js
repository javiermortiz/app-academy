export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_POKEMON = "RECEIVE_POKEMON";

import * as APIUtil from '../util/api_util'

export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const receiveAllPokemon = pokemon => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
});

export const receivePokemon = payload => ({
    type: RECEIVE_POKEMON,
    payload
})

export const requestPokemon = (pokemonId) => (dispatch) => (
    APIUtil.fetchPokemon(pokemonId)
        .then(payload => dispatch(receivePokemon(payload)))
)

window.requestPokemon = requestPokemon;
window.receivePokemon = receivePokemon;
