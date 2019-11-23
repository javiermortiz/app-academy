class Hand 
    attr_reader :my_hand
    def initialize(card1, card2, card3, card4, card5)
        @my_hand = [card1, card2, card3, card4, card5]
    end 

    def [](pos)
        @my_hand[pos]
    end 

    def []=(pos, other_card)
        @my_hand[pos] = other_card
    end 

    def get_rankings
        hand_hash = Hash.new(0)
        my_hand.each do |card|
            hand_hash[card.rank] += 1
        end 
        check_for_pairs(hand_hash)
    end 

    def check_for_pairs(hand_hash)
        pair = hand_hash.select { |k,v| v == 2 }
        ["Pair", pair.keys[0]]
    end 
end 