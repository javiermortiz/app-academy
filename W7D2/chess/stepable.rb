require_relative "board"
require "byebug"
module Stepable

    def moves
        moves = []
        move_diffs.each do |dx, dy|
            #debugger
            x, y = pos
            pos = [dx + x, dy + y]
            
            next unless board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos 
            elsif  board[pos].color != color 
                moves << pos 
            end 
        end
    end 

    private 

    def move_diffs
        raise NotImplementedError
    end 
end 