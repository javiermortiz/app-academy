export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON"
import * as APIUtil from '../util/api_util'

export const requestAllPokemon = () => (dispatch) => (
    APIUtil.fetchAllPokemon()
        .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const receiveAllPokemon = pokemon => ({
    type: RECEIVE_ALL_POKEMON,
    pokemon
});

window.requestAllPokemon = requestAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;