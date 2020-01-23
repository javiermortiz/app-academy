import React from 'react';

class ItemDetail extends React.Component {
  constructor(props) {
    super(props)
  }

  render () {
    return (
      <ul class='itemlist'>
        <li>{`${this.props.items.name}`}</li>
        <li>{`Happiness: ${this.props.items.happiness}`}</li>
        <li>{`Price: ${this.props.items.price}`}</li>
      </ul>
    )
  }
};

export default ItemDetail;