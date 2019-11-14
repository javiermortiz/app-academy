require_relative "card.rb"
class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, nil) }
    end 

    def populate(deck)
        shuffled = deck 
        @grid.each_with_index do |sub, subidx|
            sub.each_with_index do |slot, i|
                shuffled = shuffled.shuffle 
                picked_card = shuffled.pop
                @grid[subidx][i] = Card.new(picked_card)
            end 
        end 
    end 
                
    def render
        @grid.each_with_index do |sub, subidx|
            row = []
            sub.each_with_index do |slot, i|
                row << @grid[subidx][i].display
            end 
            puts "#{row}"
        end 
    end

    def won?
        @grid.flatten.all? { |card| card.face_up }
    end 

    def reveal(guessed_pos)
        sub, i = guessed_pos.split(' ').map(&:to_i)
        card = @grid[sub][i]
        if card.face_up == false 
            card.reveal 
        end 
    end 

    def []=(pos)
        sub, i = pos.split(' ').map(&:to_i)
        @grid[sub][i]
    end 
end 

# my_board = Board.new
# my_board.populate([1,1,2,2])
# my_board.render
# my_board.reveal('0 0')
# my_board.reveal('0 1')
# my_board.reveal('1 0')
# my_board.reveal('1 1')
# my_board.render 