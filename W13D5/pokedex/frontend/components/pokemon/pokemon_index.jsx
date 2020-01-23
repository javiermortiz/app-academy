import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetail from './pokemon_detail_container';
import { HashRouter, Route } from "react-router-dom";

class PokemonIndex extends React.Component{
  constructor(props) {
    super(props)
    
    this.componentDidMount = this.componentDidMount.bind(this)
    this.render = this.render.bind(this)
  }

  componentDidMount () {
      this.props.requestAllPokemon();
  }
  
  render () {
    const pokemonItems = this.props.pokemon.map((pokemon) => <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />)
    return (
      <section className="pokedex">
        <Route path="/pokemon/:pokemonId" component={PokemonDetail} />
          <ul className="index">
              {pokemonItems}
          </ul>
      </section>
   )
  }
}

export default PokemonIndex;