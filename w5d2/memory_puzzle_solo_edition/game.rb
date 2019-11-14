require_relative "board.rb"
require_relative "card.rb"
require_relative "player.rb"
require_relative "computer.rb"
class Game
    attr_reader :n, :current_player
    def initialize(human_names, pc_names)
        @board = Board.new(4)
        @prev_guess = []
        @players = []
        human_names.each {|name| @players << Player.new(name) }
        pc_names.each {|pc| @players << Computer.new(pc) }
        @current_player = @players.first
        @known_cards = Hash.new { |h,k| h[k] = []}
        @matched_cards = Hash.new { |h,k| h[k] = []}
        @score = Hash.new(0)
    end 

    def next_player!
        @players.rotate!
        @current_player = @players.first
    end 


    def play
        deck_1 = (1..8).to_a
        deck_2 = (1..8).to_a
        final_deck = deck_1 + deck_2
        @board.populate(final_deck) 
        while !@board.won?
            @board.render
            puts "Player #{self.current_player.name}, it's your turn!"
            guess_1 = self.current_player.guess(@known_cards, @matched_cards)
            @board.reveal(guess_1)
            self.add_known_card(guess_1)
            @board.render 
            @prev_guess = guess_1 

            puts "Now guess the position of the matching pair"
            guess_2 = self.current_player.guess(@known_cards, @matched_cards)
            @board.reveal(guess_2)
            self.add_known_card(guess_2)
            @board.render 

            card_1 = @board.[]=(guess_1)
            card_2 = @board.[]=(guess_2)
            if card_1.value == card_2.value && guess_1 != guess_2
                puts "You got a match!"
                self.delete_matched_cards(guess_1)
                @score[current_player.name] += 1
                puts @score 
            else 
                puts "You didn't get a match "
                @board.[]=(guess_2).hide
                @board.[]=(guess_1).hide
            end 
            sleep(3)
            system("clear")
            self.next_player!
        end 
        winner = @players[-1]
        puts @score
        puts "Congratulations player #{winner.name}, you won!"
    end 

    def add_known_card(guess)
        card = @board.[]=(guess)
        card_value = card.value
        unless @known_cards[card_value].include?(guess)
            @known_cards[card_value] += [guess]
        end 
        @known_cards.each do |card, pos| 
            if pos.length == 2
                @matched_cards[card] = pos 
                @known_cards.delete(card)
            end 
        end 
    end 

    def delete_matched_cards(guess)
        card = @board.[]=(guess)
        card_value = card.value
        @matched_cards.delete(card_value)
    end 
end 

my_game = Game.new([1, 2], [3, 4])
my_game.play
