require_relative "./item.rb"
class List
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end 

    def add_item(title, deadline, description=nil)
        if !Item.valid_date?(deadline)
            return false
        else  
            @items << Item.new(title, deadline, description)
            true 
        end 
    end 

    def size
        @items.length
    end 

    def valid_index?(index)
        if index < 0 || index >= @items.length 
            false 
        else 
            true 
        end 
    end 

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true 
        else  
            false 
        end 
    end 

    def [](index)
        if self.valid_index?(index)
            @items[index]
        else  
            nil 
        end 
    end 

    def priority
        @items.first
    end 

    def print 
        puts "------------"
        puts "  #{@label.upcase}   "
        puts "------------"
        @items.each_with_index do |el, i|
            if el.done == true 
                checkbox = '[X]'
            else  
                checkbox = '[ ]'
            end 
            puts "#{i}  | #{el.title}   | #{el.deadline}    | #{checkbox}"
        end 
    end 

    def print_full_item(index)
        if self.valid_index?(index)
            puts "#{self[index].title}   #{self[index].deadline}"
            if self[index].done == true 
                checkbox = '[X]'
            else  
                checkbox = '[ ]'
            end 
            puts "#{self[index].description}    #{checkbox}"
        end 
    end 

    def print_priority
        self.print_full_item(0)
    end 

    def up(index, amount=1)
        if self.valid_index?(index)
            amount.times do 
                self.swap(index-1, index)
                index -= 1
                return true if index == 0
            end
            true
        else  
            false
        end 
    end 

    def down(index, amount=1)
        if self.valid_index?(index)
            amount.times do 
                self.swap(index+1, index)
                index += 1
                return true if index == @items.length-1
            end
            true 
        else 
            false
        end 
    end

    def sort_by_date!
        @items.sort_by! { |el| el.deadline}
    end 

    def toggle_item(index)
        if self.valid_index?(index)
            @items[index].toggle
        end 
    end 

    def remove_item(index)
        if self.valid_index?(index)
            @items.delete_at(index)
            return true 
        else  
            return false 
        end 
    end 

    def purge
        purged = false
        while !purged 
            purged = true 

            @items.each do |item|
                if item.done == true 
                    @items.delete(item)
                    purged = false 
                end 
            end 
        end 
    end 
end 