# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
    max = 2
    (2..num).each do |divisor|
        if num % divisor == 0 && is_prime?(divisor)
            if divisor > max 
                max = divisor
            end
        end 
    end 
    max
end

def is_prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end 
    end 
    true
end


def unique_chars?(str)
    viewed_chars = ""
    str.each_char do |char|
        if viewed_chars.include?(char)
            return false 
        else  
            viewed_chars += char 
        end 
    end 
    true
end


def dupe_indices(arr)
    new_hash = get_hash_with_i(arr)
    final_hash = {}
    new_hash.each do |k, v|
        if v.length > 1
            final_hash[k] = v  
        end 
    end 
    final_hash
end

def get_hash_with_i(arr)
    viewed_items = []
    new_hash = Hash.new(0)
    arr.each_with_index do |el, i|
        if viewed_items.include?(el)
            new_hash[el] << i
        else  
            new_hash[el] = [i]
            viewed_items << el
        end 
    end 
    new_hash
end


def ana_array(arr_1, arr_2)
    if arr_1.length > arr_2.length 
        max_arr = arr_1 
        min_arr = arr_2
    else  
        max_arr = arr_2 
        min_arr = arr_1
    end 
    max_arr.each do |el|
        if !min_arr.include?(el)
            return false 
        end 
    end 
    true
end