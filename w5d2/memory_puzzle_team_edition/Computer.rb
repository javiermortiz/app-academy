class Computer
    attr_reader :brain, :matched_cards
    def initialize
        @brain = Hash.new { |brain, face| brain[face] = [] }   # [] << pos
        @matched_cards = Hash.new { |matched, face| matched[face] = [] }
    end

    def receive_revealed_card(pos, face_value)
        @brain[face_value] << pos
    end

    def make_random_guess
        valid = false
        while valid == false
            valid = true 
            row = rand(0..3)
            column = rand(0..3)
            random_pos = [row, column]
            #while @brain.values.include?(random_pos)  #[0.0]
            @brain.each do |face, positions|  # pos = [[0,0], [1,1]]
                valid = false if positions.any? { |pos| pos == random_pos } 
            end 
        end 
        random_pos
    end 

    def make_guess 
        @brain.each do |face, positions|  # positions = [[0,0], [1,1]]
            if positions.length == 2
                
                
            else
                self.make_random_guess
        end 
    end 
    
    
    # game.play
    #    guess = Computer.make_random_guess   
    #    @board.reveal(guess)
    #    face = @board[guess].face_value
    #    receive_revealed_card(guess, face)
       

    # # card 1 -  [0,0]   [1,1]
    # brain[card] => [[0, 1], [1,1]]
    # if brain.each do |k,v| if brain[key].length == 2
    #     v.first
    
end

my_pc = Computer.new()
my_pc.receive_revealed_card([0,0], 1)
my_pc.receive_revealed_card([1,1], 1)
p my_pc.make_random_guess
# The computer player's strategy should be as follows:

# On its first guess, if it knows where 2 matching cards are,
# guess one of them, otherwise guess randomly among cards it has not yet seen.

# On its second guess, if its first guess revealed a card whose value
# matches a known location, guess that location, otherwise
# guess randomly among cards it has not yet seen.

# Now comes the tricky part. With the HumanPlayer, we didn't need
# to explicitly receive the data from the card we're flipping over;
# we just read it off the terminal output. The computer won't
# be quite so savvy. Let's write some methods to have it
# accept the revealed card information from the game:

# receive_revealed_card should take in a position and the value of the card
# revealed at that location. It should then store it in a @known_cards hash.

# receive_match should take in two positions which are a successful match.
# I stored these in an instance variable @matched_cards

# The game should then call these methods on the player 
# in addition to displaying the revealed cards to the terminal.

# NB: The game shouldn't have to know whether a human or computer is playing.
# Instead, it should use duck typing. This may involve
# writing some "dummy" methods on the HumanPlayer class. That's ok.