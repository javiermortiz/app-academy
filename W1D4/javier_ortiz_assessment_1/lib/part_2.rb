def element_count(arr)
    new_hash = Hash.new(0)
    arr.each do |el| 
        new_hash[el] += 1
    end
    new_hash
end


def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash.keys.include?(char)
            str[i] = hash[char]
        end 
    end 
    str 
end


def product_inject(arr)
    arr.inject { |acc, el| acc * el }
end