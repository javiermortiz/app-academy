class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color 
        @board = board 
        @pos = pos 
    end 

    def inspect
        @color.to_s + " " + self.class.to_s
    end 
end 