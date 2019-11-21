require_relative "board"
require "byebug"
module Stepable
    def moves
        pos_moves = []
        move_diffs.each do |dir|
            #debugger
            x, y = pos
            dx, dy = dir
            new_dx, new_dy = (dx + x), (dy + y)
            new_move = [new_dx, new_dy]
            if board.valid_pos?(new_move)
                piece = board[new_move] 
                if piece.nil?
                    pos_moves << new_move 
                elsif piece.color != self.color
                    pos_moves << new_move 
                end 
            end 
        end
        pos_moves.uniq 
    end 

    def move_diffs
    end 
end 