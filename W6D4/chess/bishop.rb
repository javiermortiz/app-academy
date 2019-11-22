require_relative "board.rb"
require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable
    attr_reader :color 
    
    def initialize(color, board, pos)
        super(color, board, pos)
    end 

    def move_dirs
        diagonal_dirs
    end 
end

# my_bishop = Bishop.new(:black, [0,2])
# p my_bishop.moves([0,2])