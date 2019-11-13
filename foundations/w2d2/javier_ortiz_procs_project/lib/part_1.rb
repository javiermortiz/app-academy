def my_map(arr, &prc)
    new_arr = []
    arr.each do |el| 
        new_arr << prc.call(el)
    end
    new_arr
end

def my_select(arr, &prc)
    new_arr = []
    arr.each do |el|
        new_arr << el if prc.call(el)
    end 
    new_arr
end

def my_count(arr, &prc)
    count = 0
    arr.each do |el|
        count += 1 if prc.call(el)
    end 
    count
end

def my_any?(arr, &prc)
    result = false 
    arr.each do |el|
        result = true if prc.call(el)
    end 
    result
end

def my_all?(arr, &prc)
    result = true
    arr.each do |el|
        result = false if !prc.call(el)
    end 
    result
end

def my_none?(arr, &prc)
    result = true 
    arr.each do |el|
        result = false if prc.call(el)
    end 
    result 
end