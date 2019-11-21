require_relative "stepable"
require_relative "board"

class Knight < Piece
    include Stepable 
    attr_reader :color 

    def initialize(color, board, pos)
        @color = color 
        @board = board 
        @pos = pos 
    end 

    def move_diffs
        knight_moves = [[-1,2], [1,2], [2, -1], [2, 1], [1,2], [-1,2], [-2,1], [-2,-1]]
    end 
end