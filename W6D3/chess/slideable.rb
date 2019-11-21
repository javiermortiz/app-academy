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
        moves = []
        move_dirs.each do |dir|
            dx, dy = dir[0], dir[1]
            moves += grow_unblocked_moves_in_dir(dx, dy)
        end 
        moves
    end 

    def grow_unblocked_moves_in_dir(dx, dy)
        unblocked_moves = []
        x, y = pos 
        new_x, new_y = (dx + x), (dy + y)
        new_move = [new_x, new_y]
        while board.valid_pos?(new_move)
            piece = board[new_move]
            if piece.nil?
                unblocked_moves << new_move 
                new_x, new_y = (dx + new_x), (dy + new_y)
                new_move = [new_x, new_y]
            elsif piece.color == self.color 
                break 
            elsif piece.color != self.color 
                unblocked_moves << new_move 
                break 
            end 
        end 
        unblocked_moves 
    end 
end 