import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './components/App';
import * as serviceWorker from './serviceWorker';
// Keep the previous imports?
// import ApolloClient from "apollo-client";
import ApolloClient from "apollo-boost";
import { InMemoryCache } from "apollo-cache-inmemory";
import { createHttpLink } from "apollo-link-http";
import { VERIFY_USER } from "./graphql/mutations"
import { ApolloProvider } from "react-apollo";
import { HashRouter } from 'react-router-dom';
import { onError } from "apollo-link-error";
import { ApolloLink } from "apollo-link";


// const httpLink = createHttpLink({
//   uri: "http://localhost:5000/graphql",
//   headers: {
//     // pass our token into the header of each request
//     authorization: localStorage.getItem("auth-token")
//   }
// });

// // make sure we log any additional errors we receive
// const errorLink = onError(({ graphQLErrors }) => {
//     if (graphQLErrors) graphQLErrors.map(({ message }) => console.log(message));
// });

const cache = new InMemoryCache({
  dataIdFromObject: object => object._id || null
});

// const client = new ApolloClient({
//   link: ApolloLink.from([errorLink, httpLink]),
//   cache,
//   onError: ({ networkError, graphQLErrors }) => {
//     console.log("graphQLErrors", graphQLErrors);
//     console.log("networkError", networkError);
//   }
// });

const client = new ApolloClient({
  cache,
  uri: "http://localhost:5000/graphql",
  onError: ({ networkError, graphQLErrors }) => {
    console.log("graphQLErrors", graphQLErrors);
    console.log("networkError", networkError);
  },
  request: (operation) => {
    const token = localStorage.getItem('auth-token')
    operation.setContext({
      headers: {
        authorization: token
      }
    })
  }
})

const token = localStorage.getItem("auth-token");

cache.writeData({
  data: {
    isLoggedIn: Boolean(localStorage.getItem("auth-token"))
  }
});

// then if we do have a token we'll go through with our mutation
if (token) {
  client
    // use the VERIFY_USER mutation directly use the returned data to know if the returned
    // user is loggedIn
    .mutate({ mutation: VERIFY_USER, variables: { token } })
    .then(({ data }) => {
      cache.writeData({
        data: {
          isLoggedIn: data.verifyUser.loggedIn
        }
      });
    });
}

const Root = () => {
  return (
    <ApolloProvider client={client}>
      <HashRouter>
        <App />
      </HashRouter>
    </ApolloProvider>
  );
};

ReactDOM.render(<Root />, document.getElementById("root"));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
