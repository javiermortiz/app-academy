#Problem 1: 

def sum_recur(array)
    return array.first if array.length <= 1
    array[0] + sum_recur(array[1..-1])
end

#Problem 2: 

def includes?(array, target)
    if array.empty?
        return false 
    end 
    if array.first == target 
        return true 
    else  
        includes?(array[1..-1], target)
    end 
end

# Problem 3: ~

def num_occur(array, target)
    count = 0
    return 0 if array.empty?
    count = 1 if array.first == target
    count += num_occur(array[1..-1], target)
    count 
end

# Problem 4: 

def add_to_twelve?(array)
    return false if array.length <= 1
    if array[0] + array[1] == 12
        return true 
    else  
        add_to_twelve?(array[1..-1])
    end 
end

# Problem 5: 

def sorted?(array)
    return true if array.length <= 1
    if array[0] > array[1]
        return false 
    else  
        sorted?(array[1..-1])
    end 
end

# Problem 6: 

def reverse(string)
    return string if string.length <= 1
    string[-1] + reverse(string[0...-1])
end
