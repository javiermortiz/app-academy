require_relative "./board.rb"
require_relative "./human_player.rb"

class Game
    def initialize(n, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @board = Board.new(n)
        @current_player = @players.first
    end 

    def switch_turn
        @players.rotate!
        @current_player = @players.first
    end 

    def play
        while @board.empty_positions?
            @board.print
            position = @current_player.get_position
            mark = @current_player.mark_value
            @board.place_mark(position, mark)
            if @board.win?(mark)
                @board.print
                puts "Victory for Player #{mark}"
                return 
            else  
                self.switch_turn 
            end 
        end 
        puts 'DRAW'
    end 

end 