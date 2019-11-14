class Player
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def guess
        print "Player #{self.name}, enter a letter"
        result = gets.chomp
        return result 
    end
end