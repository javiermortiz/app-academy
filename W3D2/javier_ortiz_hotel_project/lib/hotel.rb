require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name 
        @rooms = {}
        rooms.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end 

    def name
        capital_name = @name
        capital_name = capital_name.split(' ')
        capital_name.map! { |el| el.capitalize }
        capital_name.join(' ')
    end

    def rooms
        @rooms
    end 

    def room_exists?(room)
        rooms.keys.include?(room)
    end

    def check_in(person, room)
        if !room_exists?(room)
            puts "sorry, room does not exist"
        else  
            if rooms[room].add_occupant(person)
                puts "check in successful"
            else  
                puts "sorry, room is full"
            end
        end 
    end

    def has_vacancy?
        rooms.each do |k, v|
            if !v.full?
                return true
            end 
        end
        false 
    end

    def list_rooms
        rooms.each do |k, v|
            puts k + '  ------  ' + v.available_space.to_s
        end
    end

end
