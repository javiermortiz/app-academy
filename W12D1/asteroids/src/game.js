const asteroid = require('./asteroid.js');

const gameDefault = {
    DIM_X: 500,
    DIM_Y: 500,
    NUM_ASTEROIDS: 10
}

function Game () {
    this.addAsteroids();
};

Game.prototype.randomPosition = function () {    // Math.floor((Math.random() * 100) + 1);
    let x = Math.floor((Math.random() * gameDefault.DIM_X) + 1);
    let y = Math.floor((Math.random() * gameDefault.DIM_Y) + 1);
    return [x, y];
};

Game.prototype.addAsteroids = function () {
    this.asteroids = [];
    for (let i = 0; i < gameDefault.NUM_ASTEROIDS; i++){
        this.asteroids.push(new Asteroid({"pos": this.randomPosition()}))
    }
};

Game.prototype.draw = function(ctx){
    ctx.clearRect(0, 0, gameDefault.DIM_X, gameDefault.DIM_Y);
    this.asteroids.forEach(function (asteroid) {
        asteroid.draw(ctx);
    })
};

Game.prototype.moveObjects = function(){
    this.asteroids.forEach(function (asteroid) {
        asteroid.move();
    })
}

module.exports = Game;