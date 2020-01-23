import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
    switch(action.type) {
        case RECEIVE_ALL_POKEMON:
            return Object.assign({}, action.pokemon, state);
        case RECEIVE_POKEMON:
            return Object.assign({}, state, action.payload.pokemon);
        default:
            return state;
    }
};

export default pokemonReducer;