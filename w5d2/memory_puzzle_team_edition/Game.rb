require_relative "Board.rb"
require_relative "Player.rb"

class Game

    def initialize(n=4)
        @board = Board.new(n)
        @board.populate
        @guessed_pos = []
        @player = Player.new("person")
    end 

    def play 
        until @board.won?
            @board.render
            guess_1 = @player.get_guess  #[0,0]
            @board.reveal(guess_1)
            @board.render
            guess_2 = @player.get_guess
            @board.reveal(guess_2)
            @board.render
            if @board[guess_1] == @board[guess_2] # [0,0] == [1, 1]  []=
                puts "You got a match!"
                sleep(2)
            else 
                @board[guess_1].hide
                @board[guess_2].hide
                puts "You didn't get a match!"
                sleep(3)
            end
        end 
    end

    

end

game1 = Game.new
game1.play
# The Game should have instance variable for the Board and the previously-guessed
# position (if any). It should also have methods for managing the Board-Player
# interaction. You may want a play loop that runs until the game is over.
# Inside the loop, you should render the board, prompt the player for input,
# and get a guessed pos. Pass this pos to a make_guess method, where you
# will handle the actual memory/matching logic. Some tips on implementing this:

# If we're not already checking another Card, leave the card at
# guessed_pos face-up and update the previous_guess variable.

# If we are checking another card, we should compare the
# Card at guessed_pos with the one at previous_guess.

# If the cards match, we should leave them both face-up.

# Else, flip both cards face-down.

# In either case, reset previous_guess.

# It wouldn't be an interesting game if the player could see their previous
# moves. Run system("clear") before rendering the Board. This will hide any
# previous output from the player. sleep(n) will pause the program for n seconds.
# Use this method to (temporarily) show the player an incorrect guess
# before flipping the Cards face-down again.