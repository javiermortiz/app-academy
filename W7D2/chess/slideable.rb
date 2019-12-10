require "byebug"
module Slideable
    HORIZONTAL_DIRS = [[0,1], [-1,0], [0,-1], [1,0]]
    DIAGONAL_DIRS = [[1,1], [-1,1], [-1,-1], [1,-1]]

    def horizontal_dirs 
        HORIZONTAL_DIRS
    end 

    def diagonal_dirs 
        DIAGONAL_DIRS
    end 

    def move_dirs
        # horizontal_dirs.concat(diagonal_dirs)
    end 

    def moves
        # debugger
        pos_moves = []
        move_dirs.each do |dx, dy|
            pos_moves += grow_unblocked_moves_in_dir(dx, dy)
        end 
        pos_moves
    end 

    private

    def move_dirs
        raise NotImplementedError
    end 

    def grow_unblocked_moves_in_dir(dx, dy)
        moves = []
        x, y = pos 
        loop do 
            x, y = dx + x, dy + y
            pos = [x, y]

            break unless board.valid_pos?(pos)

            if board.empty?(pos)
                moves << pos 
            else  
                moves << pos if board[pos].color != color
                break 
            end 
        end 
        moves 
    end 
end 