
class Player

    def initialize(name)
        @name = name 
    end 

    def get_guess
        puts "Choose a position ('1 0')"
        guess = gets.chomp.split(' ').map(&:to_i)
        return guess
    end


end

# Refactor game to include a HumanPlayer class
# Before actually implementing the computer player, let's make things
# easier on ourselves and refactor the game to accept player classes.
# In order to accomplish this, move all of your user input logic into
# the player class. I moved the following methods out
# of the Game class into the player:

# prompt

# get_input

# Before moving on, make sure your game runs successfully with a HumanPlayer.