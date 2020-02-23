const mongoose = require("mongoose");
const express = require("express");
const app = express();
const db = require('./config/keys').mongoURI;
const bodyParser = require("body-parser");
const expressGraphQL = require('express-graphql');
const User = require("./models/user");
const Post = require("./models/post");
const schema = require("./schema/schema");

mongoose
    .connect(db, { useNewUrlParser: true })
    .then(() => console.log("Connected to MongoDB successfully"))
    .catch(err => console.log(err));

app.use(
    "/graphql",
    expressGraphQL({
        schema,
        graphiql: true
    })
);

app.unsubscribe(bodyParser.json());
app.listen(5000, () => console.log('Server is running on port 5000'));

