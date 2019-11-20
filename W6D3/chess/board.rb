require_relative "piece.rb"
class Board
    attr_reader :chessboard
    def initialize
        @chessboard = Array.new(8) { Array.new(8,nil)}
        initial_rows_with_pieces= [0, 1, 6, 7]
        initial_rows_with_pieces.each do |row|
            @chessboard[row] = Array.new(8) { Piece.new }
        end 
    end 

    def [](pos)
        row, col = pos
        @chessboard[row][col]
    end 

    def []=(pos, val)
        row, col = pos
        @chessboard[row][col] = val 
    end 

    def move_piece(start_pos, end_pos)
        # start_row, start_col = start_pos 
        # end_row, end_col = end_pos
        # piece = @chessboard[start_row][start_col]

        # if !piece 
        #     raise StandardError.new("No piece at start position")
        # elsif @chessboard[end_row][end_col] != nil 
        #     raise StandardError.new("Not a valid end position")
        # end 

        # @chessboard[end_row][end_col] = piece 
        # @chessboard[start_row][start_col] = nil 
      
        piece = self[start_pos]
        if !piece 
            raise StandardError.new("No piece at start position")
        elsif self[end_pos] != nil 
            raise StandardError.new("Not a valid end position")
        end 
        self[end_pos] = piece  
        self[start_pos] = nil 
    end 
end 

# p my_board = Board.new 