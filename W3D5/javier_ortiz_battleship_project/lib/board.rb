class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n 
    end 

    def size
        @size
    end 

    def [](position)
        row, col = position
        @grid[row][col]
    end

    def []=(position, val)
        row, col = position
        @grid[row][col] = val
    end 

    def num_ships
        @grid.flatten.count { |el| el == :S }
    end 

    def attack(position)
        if self.[](position) == :S 
            self.[]=(position, :H)
            puts "you sunk my battleship!"
            true
        else  
            self.[]=(position, :X)
            false 
        end 
    end 

    def place_random_ships
        total_ships = self.size/4
        rows_n = @grid.length
        cols_n = @grid.length
        until self.num_ships == total_ships
            random_position = [rand(0...rows_n), rand(0...cols_n)]
            self.[]=(random_position, :S)
        end 
    end 

    def hidden_ships_grid 
        @grid.map do |row|
            row.map do |el|
                if el == :S 
                    :N 
                else  
                    el  
                end 
            end 
        end 
    end 

    def self.print_grid(grid)
        grid.each do |sub|
            puts "#{sub.join(' ')}\n"
        end 
    end 

    def cheat 
        Board.print_grid(@grid)
    end 

    def print 
        Board.print_grid(self.hidden_ships_grid)
    end 
end
