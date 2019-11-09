class Flight
    attr_reader :passengers

    def initialize(flight_num, capacity)
        @flight_number = flight_num 
        @capacity = capacity 
        @passengers = []
    end 

    def full?
        if @passengers.length >= @capacity 
            return true 
        else  
            return false 
        end 
    end 

    def board_passenger(passenger)
        unless self.full?
            if passenger.has_flight?(@flight_number)
                @passengers << passenger
            end 
        end 
    end 

    def list_passengers
        names = []
        @passengers.each do |passenger|
            names << passenger.name 
        end 
        names 
    end 

    def [](index)
        @passengers[index]
    end 

    def <<(passenger)
        self.board_passenger(passenger)
    end 
end