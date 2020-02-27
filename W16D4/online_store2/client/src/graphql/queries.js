import gql from "graphql-tag";

const FETCH_PRODUCTS = gql`
  {
    products {
      _id
      name
      description
    }
  }
`;

const FETCH_PRODUCT = gql`
  query FetchProduct($_id: ID!){
    product(_id: $_id) {
      _id
      name
      description
    }
  }
`;

const IS_LOGGED_IN = gql`
    query IsUserLoggedIn {
      isLoggedIn @client
    }
`

export { FETCH_PRODUCTS, IS_LOGGED_IN, FETCH_PRODUCT };