import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './pokemon/pokemon_index_container';
import PokemonDetail from './pokemon/pokemon_detail_container';
import { HashRouter, Route } from "react-router-dom";

const Root = ({ store }) => {
  return (
    
      <Provider store={ store }>
        <HashRouter>
          <Route path="/" component={PokemonIndexContainer} />
        </HashRouter>
          {/* <Route path="/pokemon/:pokemonId" component={ PokemonDetail }/> */}
      </Provider>
    
  )
}

export default Root