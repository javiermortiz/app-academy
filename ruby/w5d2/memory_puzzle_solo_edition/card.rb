class Card
    attr_reader :face_up, :value
    def initialize(value)
        @value = value 
        @face_up = false  
    end 

    def display
        if @face_up 
            return @value 
        else  
            return " "
        end 
    end 

    # def ==(guess)
    #     if @value == guess
    #         self.reveal 
    #         return true 
    #     end 
        
    # end 

    def hide
        @face_up = false 
    end 

    def reveal
        @face_up = true
    end 

end 