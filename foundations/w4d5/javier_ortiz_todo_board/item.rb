class Item
    def self.valid_date?(date_string)
        valid_months = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
        valid_days = ('01'..'31').to_a
        date = date_string.split('-')
        if !date.length == 3
            return false 
        elsif !valid_months.include?(date[1])
            return false
        elsif date[1].length > 2
            return false 
        elsif !valid_days.include?(date[2])
            return false 
        elsif date[2].length > 2
            return false 
        end 
        true 
    end 

    def initialize(title, deadline, description)
        @title = title
        @deadline = deadline
        @description = description
        @done = false 
        if !Item.valid_date?(@deadline)
            raise "Invalid date"
        end 
    end 

    def title 
        @title
    end 

    def title=(new_title)
        @title = new_title
    end 

    def deadline
        @deadline
    end 

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else 
            raise "Invalid date"
        end 
    end 

    def description
        @description
    end 

    def description=(new_description)
        @description = new_description
    end

    def done 
        @done 
    end 

    def toggle
        if @done == false  
            @done = true 
        else  
            @done = false 
        end 
    end 

end 