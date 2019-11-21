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
        horizontal_dirs.concat(diagonal_dirs)
    end 

    def moves(pos)
        row, col = pos 
        move_dirs.map do |dir|
            dir_row = dir[0] + row 
            dir_col = dir[1] + col 
            [dir_row, dir_col]
        end 
    end 
end 