class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
    end
    
    def valid?(position)
        position.none? { |cood| cood < 0 || cood >= @grid.length }
    end

    def empty?(position)
        @grid[position[0]][position[1]] == '_'
    end

    def place_mark(position, mark)
        if !valid?(position)
            raise "That is not a valid position."
        elsif !empty?(position)
            raise "That position is not empty."
        else  
            @grid[position[0]][position[1]] = mark
        end 
    end 

    def print
        puts '---------------'
        @grid.each {|row| puts "#{row}"}
        puts '---------------'
    end 

    def win_row?(mark)
        @grid.any? do |row|
            row.all? { |el| el == mark }
        end 
    end 

    def win_col?(mark)
        (0...@grid.length).any? do |i|
            col = []
            @grid.each do |row|
                col << row[i]
            end 
            col.all? { |el| el == mark }
        end 
    end 

    def win_diagonal?(mark)
        top = []
        bottom = []
        (0...@grid.length).each do |i|
            top << @grid[i][i]
            bottom << @grid[-i-1][-i-1]
        end 
        [top, bottom].any? do |diagonal|
            diagonal.all? { |el| el == mark }
        end 
    end 

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end 
    
    def empty_positions?
        @grid.flatten.any? { |el| el == '_'}
    end 

    def legal_positions
        legal = []
        @grid.each_with_index do |row, i|
            row.each_index do |j|
                position = [i, j]
                if self.valid?(position) && self.empty?(position)
                    legal << position
                end 
            end 
        end 
        legal 
    end 
end 
