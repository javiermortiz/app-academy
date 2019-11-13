require_relative "player.rb"
require "byebug"
class Game
    attr_reader :dictionary, :players
    def initialize(persons)
        @fragment = ""
        @dictionary = {}
        @players = []
        persons.each { |person| @players << Player.new(person)}
        @losses = Hash.new
        @players.each { |player| @losses[player] = 0}
        words = File.read("dictionary.txt").split("\n")
        words.each { |word| @dictionary[word] = nil  }
    end 

    def play_round
        current = self.current_player
        self.take_turn(current)
        self.next_player!
    end

    def current_player
        @players.first
    end 

    def previous_player
        @players.last
    end 

    def next_player!
        @players.rotate!(1)
    end 

    def valid_play?(string)
        alpha = ('a'..'z').to_a
        if alpha.include?(string) && string.length == 1
            return true 
        else
            return false 
        end 
    end

    def take_turn(player)
        input = player.guess
        if self.valid_play?(input)
            @fragment += input
        end
        result = @dictionary.keys.any? do |word|
            word.start_with?(@fragment)
        end  
        if !result 
            @fragment[-1] = ''
            print "Invalid move"
        end 
    end  

    def losses
        @losses[self.previous_player] += 1
    end

    def record(player)
        ghost = "GHOST"
        index = @losses[player] - 1
        puts ghost[0..index]
    end

    def run  
        until @players.length == 1
            result = false 
            until result 
                # debugger
                self.play_round 
                puts @fragment
                result = @dictionary.keys.any? { |word| word == @fragment}
            end 
            self.losses
            loser = self.previous_player
            puts self.record(loser)
            puts "Player #{loser.name} lost."
            @fragment = ""
            @losses = @losses.select { |player, losses_num| @losses[player] < 5 }
            @players = @losses.keys
        end 
        puts "Winner is player #{@players[0].name}"
    end 
end 

my_game = Game.new(["1", "2", "3", "4"])
my_game.run 
# p my_game.play_round 