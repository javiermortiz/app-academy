console.log("Webpack is working!");

const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

const Asteroid = require("./asteroid.js");
window.Asteroid = Asteroid;

const Game = require("./game.js");
window.Game = Game;

const GameView = require("./game_view.js")
window.GameView = GameView;

document.addEventListener("DOMContentLoaded", function() {
    const canvas = document.getElementById("game-canvas");
    const ctx = canvas.getContext("2d");
    window.ctx = ctx;
    const gameView = new GameView(ctx);
    gameView.start();
});
