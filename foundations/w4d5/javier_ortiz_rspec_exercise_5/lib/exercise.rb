require "byebug"

def zip(*arr)
    i = 0
    new_arr = []
    while i < arr[0].length
        j = 0
        arr_block = []
        while j < arr.length
            arr_block << arr[j][i]
            j += 1
        end 
        new_arr << arr_block
        i += 1
    end 

    new_arr

end

# debugger
# zip(['a', 'b', 'c'])

def prizz_proc(arr, proc_1, proc_2)
    result = []
    arr.each do |el|
        if proc_1.call(el) && !proc_2.call(el)
            result << el  
        elsif !proc_1.call(el) && proc_2.call(el)
            result << el  
        end 
    end 
    result 
end

prizz_proc([10, 9, 3, 45, 12, 15], Proc.new { |n| n % 3 == 0 }, Proc.new { |n| n % 5 == 0 })

def zany_zip(*arr)
    lengths = arr.map { |sub| sub.length }
    max_length = lengths.max 
    length_idx = lengths.index(max_length)
    i = 0
    new_arr = []
    while i < arr[length_idx].length
        j = 0
        arr_block = []
        while j < arr.length
            arr_block << arr[j][i]
            j += 1
        end 
        new_arr << arr_block
        i += 1
    end
    new_arr
end

# debugger
# zany_zip(['a','b','c'], [1, 2, 3])

def maximum(arr, &prc) # how do I access the block if the method just takes 1 arg
    procs = arr.map { |el| prc.call(el)}
    i = procs.length - 1
    max_i = i   
    current_max = nil
    while i > -1
        if current_max == nil || (current_max != nil && procs[i] > current_max)
            max_i = i
            current_max = procs[i]
            i -= 1
        else
            i -= 1
        end 
    end 
    arr[max_i]
end

def my_group_by(arr, &prc)
    hash = Hash.new(0)
    arr.each do |el|
        if hash.keys.include?(prc.call(el))
            hash[prc.call(el)] << el  
        else  
            hash[prc.call(el)] = [el] 
        end 
    end 
    hash 
end

# debugger
puts my_group_by(['mouse', 'dog', 'goat', 'bird', 'cat']) { |s| s.length } 
# { 5 => ['mouse'], 3 => ['dog', 'cat'], 4 => ['goat', 'bird']}

def max_tie_breaker(arr, proc_1, &prc)
    if arr == [] 
        return nil 
    end 

    new_arr = arr.map { |el| prc.call(el) }
    new_arr_max = new_arr.max
    max_idx = new_arr.index(new_arr_max)
    max_el = arr[max_idx]
    if tie(new_arr)
        finalists = get_finalists(arr, new_arr)
        return tie_breaker(finalists, proc_1)
    else 
        return max_el
    end 
end

def tie(arr)
    max_el = arr.max 
    count = 0
    arr.each do |el|
        if el == max_el 
            count += 1
        end 
    end 
    count > 1
end

def get_finalists(arr, new_arr)
    max = new_arr.max
    max_idxs = []
    new_arr.each_with_index do |el, i|
        if el == max 
            max_idxs << i
        end 
    end 
    finalists = []
    max_idxs.each do |idx|
        finalists << arr[idx]
    end 
    finalists

end

def tie_breaker(arr, proc)
    new_arr = arr.map { |el| proc.call(el) }
    new_arr_max = new_arr.max
    return arr[new_arr.index(new_arr_max)]
end

#debugger
length = Proc.new { |s| s.length }
o_count = Proc.new { |s| s.count('o') }
max_tie_breaker(['cat', 'swimming', 'bootcamp', 'ooooo'], o_count, &length)

def silly_syllables(str)
    words = str.split(' ')
    words.map! do |word|
        if vowels_amt(word)
            word 
        else  
            vowels_remove(word)
        end 
    end 
    words.join(' ')
end

def vowels_amt(word)
    count = 0
    vowels = 'aeiou'
    word.each_char { |l| count += 1 if vowels.include?(l) }
    if count < 2
        true
    else  
        false 
    end
end

def vowels_remove(word)
    first_vowel = nil 
    last_vowel = nil 
    vowels = 'aeiou'
    i = 0
    while i < word.length - 1
        if vowels.include?(word[i]) && first_vowel == nil 
            first_vowel = i   
        end 
        i += 1
    end 
    i = word.length - 1
    while i > -1
        if vowels.include?(word[i]) && last_vowel == nil 
            last_vowel = i   
        end 
        i -= 1
    end 
    word[first_vowel..last_vowel]
end