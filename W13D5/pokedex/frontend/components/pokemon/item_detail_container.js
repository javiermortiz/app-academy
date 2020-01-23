import { connect } from 'react-redux'
import { selectPokemonItem } from '../../reducers/selectors';
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => {
    const itemId = ownProps.match.params.itemId
    const props = {
        items: selectPokemonItem(state, itemId)
    }
    return props
};

const mapDispatchToProps = dispatch => ({
});

export default connect(
    mapStateToProps,
    mapDispatchToProps
)(ItemDetail);