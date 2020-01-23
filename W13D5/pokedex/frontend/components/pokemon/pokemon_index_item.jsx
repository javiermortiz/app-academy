import React from 'react';
import { Link } from "react-router-dom";

const PokemonIndexItem = (props) => {
  return (
    <li><Link to={`/pokemon/${props.pokemon.id}`} ><span> {props.pokemon.id} </span> <img src={props.pokemon.image_url} /> <span> {props.pokemon.name}</span> </Link></li>
  )
}

export default PokemonIndexItem;