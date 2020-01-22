
const selectAllPokemon = (state) => (
  Object.values(state['entities']['pokemon'])
)

window.selectAllPokemon = selectAllPokemon
export default selectAllPokemon