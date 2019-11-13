require "byebug"
def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each { |el| hash[el] += 1}
    new_arr = []
    hash.each do |k, v|
        new_arr << k if v < 2
    end 
    new_arr 
end 

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    arr.each_index do |i|
        return false if arr[i] == arr[i+1]
    end 
    true 
end 

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true 


def char_indices(str)
    hash = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index do |char, i|
        hash[char] << i  
    end 
    hash 
end 

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    longest_streak = ''
    i = 0
    while i < str.length 
            char = str[i]
            streak = ''
        while str[i] == char 
            streak += char 
            i += 1
        end 

        if streak.length >= longest_streak.length  
            longest_streak = streak 
        end 
    end 

    longest_streak
end 

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'


def bi_prime?(num)
    primes = []
    (2...num).each do |factor|
        primes << factor if is_prime?(factor)
    end 

    (0...primes.length).each do |start_i|
        (start_i...primes.length).each do |end_i|
            return true if primes[start_i] * primes[end_i] == num
        end 
    end 
    
    false
end 

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |el| num % el == 0}
end 

# debugger
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


def vigenere_cipher(message, keys)
    alphabet = ('a'..'z').to_a
    i = 0
    new_word = ''
    while i < message.length 
        char = message[i]
        og_char_idx = alphabet.index(char)
        new_char_idx = (og_char_idx + keys[i%keys.length]) % 26
        new_char = alphabet[new_char_idx]
        new_word += new_char 
        i += 1
    end 
    new_word 
end 

# debugger
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = 'aeiou'
    str_vowels = []
    vowels_i = []
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            str_vowels << char 
            vowels_i << i   
        end 
    end 
    last = str_vowels.pop
    str_vowels.unshift(last)
    vowels_i.each_with_index do |idx, i|
        str[idx] = str_vowels[i]
    end 
    str
end 

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"


class String 
    def select(&prc)
        return "" if prc == nil 
        new_string = ""
        self.each_char do |l|
            if prc.call(l) || l == " "
                new_string += l
            end 
        end 
        new_string 
    end 


# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""


    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end 
        self
    end 
end 

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


def multiply(a, b)
    return 0 if b == 0
    if b < 0
        - (a + multiply(a, (-b)-1))
    else 
        a + multiply(a, b-1)   
    end 
end 

# debugger
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-2, -1)      # => 2
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2
    lucas_sequence(n-1) + [(lucas_sequence(n-1)[-1] + lucas_sequence(n-1)[-2])]
end 

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


def prime_factorization(num)
    (2...num).each do |divisor|
        if num % divisor == 0
            division_result = num / divisor 
            return [*prime_factorization(divisor), *prime_factorization(division_result)]
        end
    end 
    [num]
end 


# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]