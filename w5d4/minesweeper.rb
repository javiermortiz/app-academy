class Tile
    def initialize(face_val)
        @face_val = face_val 
        @flagged = false 
        @revealed = false 
    end 

    def to_s 
        return @face_val 
    end 
end 

class Board 
    attr_reader :grid 
    
    def self.build_bombs(num_bombs=10, size=9)
        tile_vals = []
        num_bombs.times do
            tile_vals << :b
        end

        num_tiles = size * size

        empty_tiles = num_tiles - num_bombs
        empty_tiles.times do
            tile_vals << :e
        end
        tile_vals.sort!
    end

    def initialize(tile_vals, n = 9)
        @grid = Array.new(n) { Array.new(n, nil) }
        @grid.each do |row|
            row.each_with_index do |el, idx|
                row[idx] = Tile.new(tile_vals.pop)
            end
        end
    end 

    def to_s
        giant_array = []
        @grid.each do |row|
            giant_array << row.map(&:to_s)
        end 
        giant_array
    end 
end 

bombs = Board.build_bombs
b = Board.new(bombs)
puts b.grid