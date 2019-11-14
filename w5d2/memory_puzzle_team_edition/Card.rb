class Card

    attr_reader :face_value, :face_up

    def initialize(face_value)
        @face_value = face_value
        @face_up = false 
    end

    def display  # check how it will work within the game
        if @face_up == false
            return "_"
        else
            return "#{self.face_value}"
        end
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s
        self.face_value.to_s
    end

    def ==(other_card)
        self.face_value == other_card.face_value
    end
    
end

# A Card has two useful bits of information: its face value,
# and whether it is face-up or face-down. You'll want instance
# variables to keep track of this information. You'll also
# want a method to display information about the card:
# nothing when face-down, or its value when face-up.
# I also wrote #hide, #reveal, #to_s, and #== methods.

# Common problem: Having issues with #hide and #reveal? Try testing small.