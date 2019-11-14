# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"
class Array
    def span
        if self != []
            self.max - self.min
        else
            nil
        end 
    end

    def average
        if self != []
            self.sum / (self.length * 1.0)
        else  
            nil 
        end 
    end

    def median
        mid = self.length/2
        if self == []
            nil    
        elsif self.length.odd?
            self.sort[mid]
        else  
            (self.sort[mid] + self.sort[mid-1]) / (2 * 1.0)
        end 
    end

    def counts
        hash = Hash.new(0)
        self.each do |el|
            hash[el] += 1
        end 
        hash
    end

    def my_count(val)
        count = 0
        self.each { |el| count += 1 if el == val}
        count 
    end 

    def my_index(val)
        self.each_with_index do |el, i|
            if el == val 
                return i
            end 
        end 
        nil
    end 

    def my_uniq
        filtered = []
        self.each do |el|
            if !filtered.include?(el)
                filtered << el  
            end 
        end 
        filtered
    end

    def my_transpose
        new_arr = []
        row_length = self.first.length
        self.each_index do |j|
            block = []
            (0...row_length).each do |i|
                block << self[i][j]
            end 
            new_arr << block 
        end 
        new_arr 
    end
end