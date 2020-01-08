const View = require('./ttt-view');
const Game = require('../node_solution/game');

  $(() => {
    const game = new Game();
    const $ttt = $('.ttt');
    const view = new View(game, $ttt);
    console.log("Webpack running");
    window.view = view;
  });
