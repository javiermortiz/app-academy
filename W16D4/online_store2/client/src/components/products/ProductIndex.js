import React from "react";
import { Query } from "react-apollo";
import { FETCH_PRODUCTS } from "../../graphql/queries";
import { Link } from "react-router-dom";
import CreateProduct from "./CreateProduct";

class ProductIndex extends React.Component {

    render () {
        return (
            <div>
                <Query query={FETCH_PRODUCTS}>
                {({ loading, error, data }) => {
                    if (loading) return "Loading...";
                    if (error) return `Error! ${error.message}`;
    
                    return (
                    <ul>
                        {data.products.map(product => (
                        <Link to={`/${product._id}`}>
                            <li key={product._id}>
                                {product.name}
                                <br/>
                                {product.description}
                            </li>
                        </Link>
                        ))}
                    </ul>
                    );
                }}
                </Query>
                <CreateProduct />
            </div>
        );
    }
}

export default ProductIndex;