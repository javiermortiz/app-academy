import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {
  return (
      <li><Link to='/pokemon/:pokemonId' ><img src={props.pokemon.image_url} /> {props.pokemon.name}</Link></li>
  )
}

export default PokemonIndexItem;