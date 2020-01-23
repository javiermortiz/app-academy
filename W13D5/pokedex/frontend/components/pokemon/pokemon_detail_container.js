import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps) => {
    const pokemonId = ownProps.match.params.pokemonId
    const props = {
    pokemon: state["entities"]["pokemon"][pokemonId],
      items: Object.values(state["entities"]["items"])
    }
    return props
};

const mapDispatchToProps = dispatch => ({
  requestPokemon: (pokemonId) => dispatch(requestPokemon(pokemonId))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
