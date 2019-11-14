class HumanPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        puts "Player #{mark_value}, enter a valid row col position as two numbers with a space between them."
        position = gets.chomp.split(' ').map(&:to_i)
        while !legal_positions.include?(position)
            puts "Your choice was illegal, enter another"
            position = gets.chomp.split(' ').map(&:to_i)
        end 
        position
    end 
end