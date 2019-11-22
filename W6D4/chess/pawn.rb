require_relative "piece"

class Pawn < Piece
    attr_reader :color

    def initialize(color, board, pos)
        super(color, board, pos)
    end

    def move_dirs
        forward_steps + side_attacks 
    end 

    def at_start_row?
        if self.color == :black && pos[0] == 1
            return true 
        elsif  
            self.color == :white && pos[0] == 6
            return true 
        end 
        false 
    end 

    def forward_dir
        if self.color == :black
            return 1
        else  
            return -1
        end 
    end 

    def forward_steps
        forward = []
        x, y = pos
        new_x, new_y = (forward_dir + x), y
        new_move = [new_x, new_y]
        forward << new_move 
        if at_start_row?
            new_move_2 = [new_x + forward_dir, new_y] 
            forward << new_move_2 
        end 
        forward.select do |forward_move|
            if board.valid_pos?(forward_move)
                piece = board[forward_move]
                piece.nil?
            end 
        end 
    end 

    def side_attacks
        diagonals = []
        x, y = pos
        new_x, new_y = (forward_dir + x), (y + 1)
        new_move = [new_x, new_y]
        diagonals << new_move 
        new_x, new_y = (forward_dir + x), (y - 1)
        new_move = [new_x, new_y]
        diagonals << new_move 
        diagonals.select do |diagonal|
            if board.valid_pos?(diagonal)
                piece = board[diagonal]
                piece.color != self.color && piece.color != nil 
            end 
        end 
    end 
end 