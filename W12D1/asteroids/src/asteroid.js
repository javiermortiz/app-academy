const Util = require("./util.js")
const Game = require("./game.js")

const defaults = {
    COLOR: "blue",
    RADIUS: 20,
    POS: [30, 30],
    SPEED: 1
}

function Asteroid(options) {   //{ pos: [30, 30] } 
    if (!options) {
    options = {}; 
    }
    options["game"] = options["game"];
    options["pos"] = options["pos"] || defaults.POS; // { pos: [30, 30], radius: something }   [[30,30], something]
    options["vel"] = options["vel"] || Util.randomVec(defaults.SPEED);
    options["radius"] = options["radius"] || defaults.RADIUS;
    options["color"] = options["color"] || defaults.COLOR;
    MovingObject.call(this, options);
};

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;