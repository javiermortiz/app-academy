import React from "react";
import { Query } from "react-apollo";
import { FETCH_PRODUCTS, FETCH_PRODUCT } from "../../graphql/queries";
import { Link } from "react-router-dom";


class ProductDetail extends React.Component {

  render() {
    return (
      <Query query={FETCH_PRODUCT} variables={{ _id: this.props.match.params.id }}>
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <div>
              <h1>{data.product.name}</h1>
              <ul>
                <li>{`Description: ${data.product.description}`}</li>
                <li>{`Weight: ${data.product.weight}`}</li>
              </ul>
            </div>
          );
        }}
      </Query>
    );
  }
}

export default ProductDetail;