const asteroid = require('./asteroid.js');


const gameDefault = {
    DIM_X: 500,
    DIM_Y: 500,
    NUM_ASTEROIDS: 4
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
        this.asteroids.push(new Asteroid({"pos": this.randomPosition(), "game": this}))
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

Game.prototype.wrap = function (pos){
    if (pos[0] > gameDefault.DIM_X){
        pos[0] = pos[0] % gameDefault.DIM_X;
    }else if (pos[0] < 0){
        pos[0] += gameDefault.DIM_X;
    }

    if (pos[1] > gameDefault.DIM_Y) {
        pos[1] = pos[1] % gameDefault.DIM_Y;
    } else if (pos[1] < 0) {
        pos[1] += gameDefault.DIM_Y;
    }
    return pos;
};

Game.prototype.checkCollisions = function () {
    for (let i = 0; i < this.asteroids.length-1; i++){  // [1, 2, 3]
        for (let j = i+1; j < this.asteroids.length; j++){
            if (this.asteroids[i].isCollideWith(this.asteroids[j])){
                alert("COLLISION! BOOM!");
            }
        }
    }
};

Game.prototype.step = function(){
    this.moveObjects();
    this.checkCollisions();
}

module.exports = Game;