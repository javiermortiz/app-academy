def partition(arr, n)
  below = []
  eq_above = []
  arr.each do |el|
    if el < n
        below << el  
    else  
        eq_above << el  
    end
  end
  [below, eq_above]
end


def merge (hash_1, hash_2)
    merged = Hash.new

    hash_1.each do |key, val|
        merged[key] = val
    end 
    hash_2.each do |key,val|
        merged[key] = val
    end 

    return merged
end


def censor(str, arr)
    vowels = 'aeiouAEIOU'
    words = str.split(' ')
    words.each_with_index do |word, idx|
        if arr.include?(word.downcase)
            letters = word.split('')
            censored_word = []
            letters.each_with_index do |l, i| 
                if vowels.include?(l)
                    censored_word << "*"
                else  
                    censored_word << l
                end
            end 
            words[idx] = censored_word.join('')
        end
    end 
    words.join(' ')
end


def power_of_two?(num)
    n = 0
    while n < num 
        if 2**n == num 
            return true
        else  
            n += 1
        end 
    end  
    false
end