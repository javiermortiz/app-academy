class ComputerPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        position= legal_positions.sample
        puts "Computer #{self.mark_value} chose position #{position}"
        position
        # choice = 
        # alphabet = ('a'..'z').to_a
        # puts "Player #{mark_value}, enter a valid row col position as two numbers with a space between them."
        # result = gets.chomp
        # alphabet.each { |l| raise "Not a valid enter" if result.include?(l) }
        # position = result.split(' ').map(&:to_i)
        # raise "Not a valid enter" if position.length != 2
        # position  
    end 
end