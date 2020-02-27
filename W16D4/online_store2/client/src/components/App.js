import React, { Component } from "react";
import { Switch, Route, HashRouter, Link } from "react-router-dom";
import ProductIndex from "./products/ProductIndex";
import Login from "./Login";
import ProductDetail from "./products/ProductDetail";
import Register from "./Register";
import AuthRoute from "../util/route_util";
import Nav from "./Nav";
import CreateProduct from "./products/CreateProduct";

const App = () => {
  return (
    <div>
      <Link to="/"><h1>Online Store</h1></ Link>
      <Route path="/" component={Nav} />
      <Switch>
        <AuthRoute exact path="/login" component={Login} routeType="auth" />
        <AuthRoute exact path="/register" component={Register} routeType="auth" />
        <Route exact path="/" component={ProductIndex} />
        <Route exact path="/:id" component={ProductDetail} />
        {/* <Route exact path="/new_product" component={CreateProduct} /> */}
      </Switch>
    </div>
  );
};
    
export default App;