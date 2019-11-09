def average(num_1, num_2)
    (num_1 + num_2) / 2.0
end


def average_array(arr)
    arr.sum / (arr.length * 1.0)
end


def repeat(str, num)
    str * num
end


def yell (str)
    letters = str.split('').map { |l| l.upcase }
    letters.join('') + "!"
end


def alternating_case(str)
    words = str.split(' ')
    words.each_index do |i|
        if i % 2 == 0
            letters = words[i].split('').map { |l| l.upcase }
            words[i] = letters.join('')
        else  
            letters = words[i].split('').map { |l| l.downcase }
            words[i] = letters.join('')
        end
    end
    words.join(' ')
end