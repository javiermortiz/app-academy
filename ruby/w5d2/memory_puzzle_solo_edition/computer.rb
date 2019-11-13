class Computer
    attr_reader :name 
    def initialize(name)
        @name = name
        @match = false
        @card = nil 
    end 

    def guess(known_cards, matched_cards)
        if matched_cards.empty?
            return known_cards.values.sample[0]
        else  
            if @match 
                @match = false 
                pos = matched_cards[@card][1]
                @card = nil 
                return pos 
               
            else  
                @card = matched_cards.keys[0]
                @match = true 
                return matched_cards[@card][0]
            end
        end
    end


end 