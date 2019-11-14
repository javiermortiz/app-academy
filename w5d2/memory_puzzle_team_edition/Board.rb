require_relative "Card.rb"

class Board

    def initialize(n=4)
        @grid = Array.new(n) { Array.new(n) } #[[Card.object(1), nil, nil, nil],[], [], []  [1,1 ,2,2,3,3,4,]
        @size = n * n
    end 

    def populate
        deck = []
        ( 1..(@size/2) ).each do |val|
            deck << val 
            deck << val 
        end 
        deck.shuffle!
        @grid.each do |sub|
            sub.each_with_index do |slot, i|
                sub[i] = Card.new(deck.shift)
            end 
        end 
    end 

    def render
        print "  "
        (0...@grid.length).each { |num| print "#{num}" + " " }
        puts "\n"
        @grid.each_with_index do |sub, i|
            
            sub.each.with_index do |card, idx|
                if idx == 0
                    print "#{i}" + " "
                end 
                print card.display + " "
            end
            puts "" 
        end 
    end 

    def won?
        @grid.flatten.all? { |card| card.face_up}
    end

    def reveal(guessed_pos)  #[0, 0]   "0 0"
        row, column = guessed_pos
        card = @grid[row][column]

        card.reveal
        return card.face_value
    end

    def [](position) # [1, 0]
        row, column = position
        @grid[row][column]
    end 

end

# my_board = Board.new
# my_board.populate 
# my_board.render
# p my_board.won?
# my_board.reveal([1, 1])
# my_board.render

# The Board is responsible for keeping track of all your Cards.
# You'll want a grid instance variable to contain Cards. Useful methods:

# #populate should fill the board with a set of shuffled Card pairs

# #render should print out a representation of the Board's current state

# #won? should return true if all cards have been revealed.

# #reveal should reveal a Card at guessed_pos (unless it's already face-up,
# in which case the method should do nothing). It should also return the
# value of the card it revealed (you'll see why later).

# Parallel Assignment

# In Ruby you can declare and assign multiple variables at once using
# commas to separate multiple variables and values. For example,
#       x, y, z = 1, 2, 3 # x = 1, y = 2, z = 3

# And if there's not the same number of variables and values?
#       x, y = 1, 2, 3 # x = 1, y = 2, 3 is not assigned
#       a, b, c = 10, 20 # a = 10, b = 20, c = nil

# When there are multiple variables assigned to an array,
# Ruby expands the array so that each element becomes its own value! For example,
#       x, y, z = [1, 2, 3] # x = 1, y = 2, z = 3
#       a, b, c = [10, 20] # a = 10, b = 20, c = nil

# This is very helpful to use when writing [](pos) and []=(pos, value)
# for your Board to access row and col. Because the pos exists as an array,
# it's better to pass it as an array in a method call, relying on the method to index the array.