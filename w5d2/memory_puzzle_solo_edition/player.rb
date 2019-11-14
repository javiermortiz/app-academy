class Player
    attr_reader :name
    def initialize(name)
        @name = name 
    end 

    def guess(known_cards, matched_cards)
        puts "Enter a guess"
        result = gets.chomp
        result 
    end 
end 