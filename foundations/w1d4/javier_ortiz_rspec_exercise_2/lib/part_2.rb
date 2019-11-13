def palindrome?(str)
    left = 0
    right = str.length - 1
    while left < str.length && right > -1
        if str[left] != str[right]
            return false
        elsif str[left] == str[right]
            left += 1
            right -= 1
        end
    end
    true
end


def substrings(str)
    letters = str.split('')
    subs = []
    while letters.length > 0 
        last_acc = letters.inject do |acc, el|
            subs << acc
            acc + el
        end 
        subs << last_acc
        letters.shift
    end
    subs
end


def palindrome_substrings(str)
    subs = substrings(str)
    subs.select { |el| palindrome?(el) && el.length > 1}
end