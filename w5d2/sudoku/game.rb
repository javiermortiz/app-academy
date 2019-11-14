require_relative "board"

class Game
    def initialize(file)
        grid = Board.from_file(file)
        @board = Board.new(grid)
    end

    def get_position
        puts "Enter a position:"
        position = gets.chomp.split(" ").map(&:to_i)
        position
    end

    def get_value
        puts "Enter a value:"
        value = gets.chomp.to_i
        value
    end

    def play
        until @board.solved?
            @board.render
            pos = self.get_position
            value = self.get_value
            @board[pos] = value # @board.[]=(position, value)
        end
        puts "You won!"
    end
end

game = Game.new("./puzzles/sudoku1_almost.txt")
game.play