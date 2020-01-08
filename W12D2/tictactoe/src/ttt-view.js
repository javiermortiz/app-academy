class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game;
    this.setupBoard();
    this.bindEvents();    
  }

  bindEvents() {        //function (e)
    $("li").on("click", (e) => {
      const $square = $(e.currentTarget);
      this.makeMove($square);
    });
  }

  gameOver() {
    const $win = $("<h2 class=\"win\"></h2>");
    $win.text(this.game.winner() + " wins!").appendTo(this.$el);
    //console.log(this.game.winner());
    $("." + this.game.winner()).addClass("win-square");
  }

  makeMove($square) {
    const currentPlayer = this.game.currentPlayer;
    //console.log(currentPlayer);
    $square.addClass(currentPlayer);
    try {
      this.game.playMove($square.data("pos"));
    } catch (err) {
      alert("Invalid move!");
    }    
    if (this.game.isOver()) {
      console.log(this.game.winner());
      $("li").off();
      this.gameOver();
    }
  }

  setupBoard() {
    // const $grid = $('<ul>')
    // const $right_square = $('<li class="right-suqare>');
    // const $center_square = $('<li class="center-suqare>');
    // const $left_square = $('<li class="left-suqare>');

    $("<ul class=\"grid\"></ul>").appendTo(this.$el);
    for (let i = 0; i < 3; i++)
      for (let j = 0; j < 3; j++){
        let $li = $("<li></li>");
        $li.data("pos", [i, j]);
        //attr("data", [i, j]);   
        $li.appendTo(".grid");      
      }
  }
}

module.exports = View;


// $("li").attr("data", [i, j])