require_relative "piece.rb"
require_relative "bishop.rb"
require_relative "slideable.rb"
require_relative "rook"
require_relative "queen"
require_relative "knight"
require_relative "king"
require_relative "pawn"
require_relative "null_piece"

class Board
    attr_reader :rows, :board
    def initialize
        @rows = Array.new(8) { Array.new(8, NullPiece.instance) }
    end 

    def self.pieces 
        board = Board.new 
        subclasses = [Rook, Knight, Bishop, Queen, 
        King, Bishop, Knight, Rook]
        subclasses.each_with_index do |subclass, idx|
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
            board[[0,idx]] = subclass.new(:black, board, [0,idx])
        end 
        (0..7).each do |idx|
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
            board[[1,idx]] = Pawn.new(:black, board, [0,idx])
        end 
        subclasses.each_with_index do |subclass, idx|
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
            board[[7,idx]] = subclass.new(:white, board, [7,idx])
        end 
        (0..7).each do |idx|
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
            board[[6,idx]] = Pawn.new(:white, board, [6,idx])
        end 
        board 
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
        if piece.nil?
            raise StandardError.new("No piece at start position")
        elsif !valid_pos?(end_pos)
            raise StandardError.new("Not a valid end position")
        end 
        self[end_pos] = piece  
        self[start_pos] = NullPiece.instance 
    end 

    def valid_pos?(pos)
        pos.all? { |coord| coord >= 0 && coord <= 7}
    end 

end 

# p my_board = Board.new 