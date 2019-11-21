require_relative "piece.rb"
require_relative "bishop.rb"
require_relative "slideable.rb"

class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) { Array.new(8,nil)}
    end 

    def pieces 
        # board = Board.new 
        # initial_rows_with_pieces = [0, 1, 6, 7]
        # initial_rows_with_pieces.each do |row|
        #     @rows[row] = Array.new(8) { Bishop.new(:black, board, ) }
        # end 
        # self[[0,0]] = Bishop.new(:black, board, [0,0])
    end 

    def [](pos)
        row, col = pos
        @rows[row][col]
    end 

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val 
    end 

    def move_piece(start_pos, end_pos)
      
        piece = self[start_pos]
        if !piece 
            raise StandardError.new("No piece at start position")
        elsif self[end_pos] != nil 
            raise StandardError.new("Not a valid end position")
        end 
        self[end_pos] = piece  
        self[start_pos] = nil 
    end 

    def valid_pos?(pos)
        pos.all? { |coord| coord >= 0 && coord <= 7}
    end 

end 

# p my_board = Board.new 