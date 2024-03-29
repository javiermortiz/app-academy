require_relative "board.rb"
require_relative "piece.rb"
require_relative "slideable.rb"

class Rook < Piece 
    include Slideable
    attr_reader :color 
    
    def initialize(color, board, pos)
        super(color, board, pos)
    end 

    def move_dirs
        horizontal_dirs
    end 
end 