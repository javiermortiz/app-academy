class Tile 
    attr_reader :value 
    def initialize(value=nil)
        if value == nil || value == 0
            @given = false 
        else  
            @given = true 
        end 
        value ||= 0
        @value = value   
    end 

    def value=(new_value)
        if @given
            raise "Can't change a given tile" 
        else 
            @value = new_value 
        end 
    end 
end 

# t = Tile.new()
# t = Tile.new(8)
# p t 