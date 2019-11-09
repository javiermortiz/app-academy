def duos(str)
    count = 0
    i = 0
    while i < str.length-1
        char = str[i]
        while char == str[i+1]
            count += 1
            i += 1
        end 
        i += 1
    end 
    count
end 

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0


def sentence_swap(str, hash)
    words = str.split(' ')
    words.map! do |word|
        if hash.has_key?(word)
            hash[word]
        else 
            word
        end 
    end
    words.join(' ')
end 

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'


def hash_mapped(hash, proc, &prc)
    new_hash = {}
    hash.each do |k, v|
        new_hash[prc.call(k)] = proc.call(v)
    end 
    new_hash
end 

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}


def counted_characters(str)
    dupes = []
    str.each_char.with_index do |char, start_i|
        count = 0
        str.each_char do |counter|
            count += 1 if counter == char 
        end 
        dupes << char if count > 2
    end 
    dupes.uniq
end 

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []


def triplet_true?(str)
    i = 0
    while i < str.length 
        char = str[i]
        count = 0
        while char == str[i]
            count += 1
            i += 1
        end 

        if count >= 3
            return true 
        end 
    end 
    false 
end 

# p triplet_true?('caaabb')        # true
# p triplet_true?('terrrrrible')   # true
# p triplet_true?('runninggg')     # true
# p triplet_true?('bootcamp')      # false
# p triplet_true?('e')             # false


def energetic_encoding(str, hash)
    new_str = ''
    str.each_char do |char|
        if hash.has_key?(char)
            new_str += hash[char]
        elsif char == ' '
            new_str += ' '
        else  
            new_str += '?'
        end 
    end 
    new_str 
end 

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'


def uncompress(str)
    new_str = ''
    str.each_char.with_index do |char, i|
        if i.even?
            new_str += char * str[i+1].to_i
        end 
    end 
    new_str
end 

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'


def conjunct_select(arr, *procs)
    arr.select do |el|
        procs.all? do |proc|
            proc.call(el)
        end 
    end 
end 

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


def convert_pig_latin(str)
    #word < 3 remains the same
    #word >= 3 changes
    # if it begins with a vowel, add yay to the end
    # else, all letters after first vowel to the end and add ay
    #respect capitalization
    vowels = 'aeiouAEIOU'
    words = str.split(' ')
    words.map! do |word|
        if word.length < 3
            word
        elsif vowels.include?(word[0])
            word += 'yay'
        else
            first_v = get_first_v(word)
            new_word = word[first_v..-1] + word[0...first_v] + 'ay'
            new_word = new_word.capitalize if word[0] == word[0].upcase
            new_word
        end 
    end 
    words.join(' ')
end 

def get_first_v(word)
    vowels = 'aeiou'
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return i
        end 
    end 
end 

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"


def reverberate(str)
    # word < 3 unchanged
    # word >= 3 change
    # ends with vowel, repeat the word twice
    # end no vowel, repeat all letters after last v, including v
    vowels = 'aeiouAEIOU'
    words = str.split(' ')
    words.map! do |word|
        if word.length < 3
            word
        elsif vowels.include?(word[-1])
            word = word + word
        else
            last_v = get_last_v(word)
            new_word = word + word[last_v..-1]
            new_word = new_word.capitalize if word[0] == word[0].upcase
            new_word
        end 
    end 
    words.join(' ')
end 

def get_last_v(word)
    vowels = 'aeiou'
    i = word.length - 1
    while i > -1
        if vowels.include?(word[i])
            return i
        end 
        i -= 1
    end 
end 

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


def disjunct_select(arr, *procs)
    arr.select do |el|
        procs.any? { |proc| proc.call(el) }
    end 
end 

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]


def alternating_vowel(str)
    new_str = []
    words = str.split(' ')
    words.each_with_index do |word, i|
        if i.even?
            new_str << no_first_v(word)
        else  
            new_str << no_last_v(word)
        end 
    end 
    new_str.join(' ')
end 

def no_first_v(word)
    vowels = 'aeiou'
    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            word.slice!(i)
            return word 
        end 
    end 
    word 
end 

def no_last_v(word)
    vowels = 'aeiou'
    i = word.length-1
    while i > -1
        if vowels.include?(word[i])
            word.slice!(i)
            return word 
        end 
        i -= 1
    end 
    word 
end 

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(str)
    words = str.split(' ')
    words.map! do |word|
        if word.end_with?('a', 'e', 'i', 'o', 'u')
            word += word[-1]
        else  
            b_trans(word)
        end 
    end 
    words.join(' ')
end 

def b_trans(word)
    vowels = 'aeiouAEIOU'
    letters = word.split('')
    letters.each_with_index do |char, i|
        if vowels.include?(char)
            letters[i] = char + 'b' + char.downcase 
        end 
    end 
    letters.join('')
end 

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"


def compress(str)
    new_str = ''
    i = 0
    while i < str.length
        char = str[i]
        count = 0
        while char == str[i]
            count += 1
            i += 1
        end 

        if count >= 2
            new_str += char + count.to_s
        else  
            new_str += char
        end 
    end 
    new_str 
end 

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"