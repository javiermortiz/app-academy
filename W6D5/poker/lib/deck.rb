require_relative "card"

class Deck 
    SUITES = [:Spades, :Hearts, :Diamonds, :Clubs]
    RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    attr_accessor :cards

    def initialize
        @cards = []
    end 

    def sort_deck
        SUITES.each do |suit|
            RANKS.each do |rank|
                @cards << Card.new(rank, suit)
            end 
        end 
        cards.shuffle!
    end 
end 