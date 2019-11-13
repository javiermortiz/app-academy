require_relative "tile.rb"
class Board
    def initialize(grid)
        @grid = grid 
    end 

    def self.from_file(file)
        grid = []
        File.open(file).each do |line|
            tiles = line.chomp.split('').map(&:to_i)
            row = []
            tiles.each do |tile|
                row << Tile.new(tile)
            end 
            grid << row 
        end
        grid 
    end 

    def []=(position, value)
        row_i, col_i = position #[0,0]
        @grid[row_i][col_i].value=(value)
    end 

    def render
        @grid.each do |row|
            rendered_row = []
            row.each do |tile|
                rendered_row << tile.value 
            end 
            puts "#{rendered_row}"
        end 
    end 

    def rows_solved?
        solved_row_hash = {1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1, 8 => 1, 9 => 1}
        rows = []
        @grid.each do |row|
            row_hash = Hash.new(0)
            row.each do |tile|
                row_hash[tile.value] += 1
            end 
            rows << row_hash 
        end 
        rows.all? { |row| row == solved_row_hash }
    end 

    def cols_solved?
        solved_col_hash = {1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1, 6 => 1, 7 => 1, 8 => 1, 9 => 1}
        cols = []
        (0...@grid[0].length).each do |col_i|
            col_hash = Hash.new(0)
            @grid.each_with_index do |row, row_i|
                tile = @grid[row_i][col_i]
                col_hash[tile.value] += 1
            end 
            cols << col_hash
        end 

        cols.all? { |col| col == solved_col_hash}
    end 

# [0, 0, 3, 0, 2, 0, 6, 0, 0] => [[0, 0, 3], [0, 2, 0], [6, 0, 0]]
# [9, 0, 0, 3, 0, 5, 0, 0, 1] => [[9, 0, 0], [3, 0, 5], [0, 0, 1]]
# [0, 0, 1, 8, 0, 6, 4, 0, 0] => [[0, 0, 1], [8, 0, 6], [4, 0, 0]]
# [0, 0, 8, 1, 0, 2, 9, 0, 0]
# [7, 0, 0, 0, 0, 0, 0, 0, 8]
# [0, 0, 6, 7, 0, 8, 2, 0, 0]
# [0, 0, 2, 6, 0, 9, 5, 0, 0]
# [8, 0, 0, 2, 0, 3, 0, 0, 9]
# [0, 0, 5, 0, 1, 0, 3, 0, 0]
# [ [[0, 0, 3], [0, 2, 0], [6, 0, 0]] [[9, 0, 0], [3, 0, 5], [0, 0, 1]] ]

# [[[0, 0, 3], [9, 0, 0], [0, 0, 1]], [[0, 2, 0, [3, 0, 5], [8, 0, 6]]]
# [[0, 0, 3, 9, 0, 0, ]]
    def squares_solved?
        nums_arr = (1..9).to_a
        new_grid = @grid.map { |row| row.each_slice(3).to_a }
        squares = new_grid.transpose
        squares = squares.flatten.each_slice(9).to_a
        squares.all? do |square|
            square.map(&:value).sort == nums_arr 
        end 
        # p new_grid 
    end 

        # new_arr = []
        # @grid.each do |row|
        #     row.each_with_index do |el, i|
        #         new_arr.push(row[i], row[i+1], row[i+2])
        # (0..2)
        # (0..2)

        # (3..5)
        # (0..2)

        # (6..8)
        # (0..2)

    def solved?
        self.rows_solved? && self.cols_solved? && self.squares_solved?
    end 
end 


# grid= Board.from_file("./puzzles/sudoku1_solved.txt")
grid= Board.from_file("./puzzles/sudoku1.txt")
my_board = Board.new(grid)
# my_board.[]=([0,0], 5)
# p my_board.[]=([0,2], 5)
# my_board.render
# p my_board.rows_solved? 
# p my_board.cols_solved?
# p my_board.squares_solved?
p my_board.solved?
