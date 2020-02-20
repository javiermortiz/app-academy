const express = require("express");
const app = express();

const port = process.env.port || 3000;

app.get("/", (req, res) => res.send("Hello from Cindy and Javier!"));

app.listen(port, () => `Listening on ${port}`);
