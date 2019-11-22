require_relative "stepable"

class King < Piece
    include Stepable
    attr_reader :color 

    def initialize(color, board, pos)
        @color = color 
        @board = board 
        @pos = pos 
    end 

    def move_diffs
        king_moves = [[0,-1], [1,-1], [1,0], [1,1], [0,1], [-1,1], [-1,0], [-1,-1]]
    end 
end 