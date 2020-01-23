import React from 'react'
import ItemDetailContainer from './item_detail_container';
import { Link } from "react-router-dom";
import { Route } from "react-router-dom";

class PokemonDetail extends React.Component {
    constructor (props) {
        super(props);
    }

    componentDidMount () {
        const pokemonId = this.props.match.params.pokemonId
        this.props.requestPokemon(pokemonId)
    }

    componentDidUpdate (prevProps) {
        const prevPokemonId = prevProps.match.params.pokemonId;
        const currentPokemonId = this.props.match.params.pokemonId;
        if (prevPokemonId !== currentPokemonId ) {
            this.props.requestPokemon(currentPokemonId);
        }
    }


    render () {
      if (!this.props.pokemon) {
          return <div>No pokemon yet!</div>
      } else if (!this.props.pokemon.attack) {
          return <div>No items yet!</div>
      } else {
        let moves = this.props.pokemon.moves.map(move => {
          return ` ${move}`
        })
        let items = this.props.items.map(item => {
            return <li class='itempics'><Link to={`/pokemon/${this.props.pokemon.id}/items/${item.id}`}> <img src={item.image_url} /> </Link></li>
        })
          return (
              <div class='detail'>
                  <img src={this.props.pokemon.image_url} />
                  <ul>
                      <h1>{`${this.props.pokemon.name}`}</h1>
                      <li>{'Type: ' + `${this.props.pokemon.poke_type}`}</li>
                      <li>{'Attack: ' + `${this.props.pokemon.attack}`}</li>
                      <li>{'Defense: ' + `${this.props.pokemon.defense}`}</li>
                      <li>{'Moves: ' + moves}</li>
                  </ul>
                  <ul class='itemslist'>
                    {items}
                  </ul>
                  <Route path="/pokemon/:pokemonId/items/:itemId" component={ItemDetailContainer} />
              </div>
          )
      }
        
    }
}

export default PokemonDetail;