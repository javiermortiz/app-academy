require "byebug"
def select_even_nums(arr)
    arr.select(&:even?)
end


def reject_puppies(arr)
    arr.reject { |dog| dog['age'] <= 2}
end


def count_positive_subarrays(arr)
    arr.count { |subarray| subarray.sum > 0}
end


def aba_translate(word)
    new_word = ''
    vowels = 'aeiou'
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            new_word += char + 'b' + char 
        else  
            new_word += char 
        end 
    end 
    new_word 
end


def aba_array(arr)
    arr.map { |el| aba_translate(el)} # why arr.map(&:aba_translate) didnt work
end