# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alpha = ("a".."z").to_a 
  new_message = ""
  letters = str.split('')
  letters.each do |l|
    if alpha.include?(l)
      og_idx = alpha.index(l)
      new_idx = (og_idx + shift) % 26
      new_message += alpha[new_idx]
    else  
      new_message += l
    end 
  end 
  new_message  
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

# Example:
# digital_root(4322) => digital_root(11) => (2)

def digital_root(num)
    return num if num < 10
    result = num % 10 + digital_root(num/10)
    if result < 10
        result 
    else 
        digital_root(result)
    end 
end 
# def digital_root(num)
#   rooted_num = digital_root_step(num)
#   while rooted_num > 10
#     rooted_num = digital_root_step(rooted_num)
#   end 
#   rooted_num 
# end

# def digital_root_step(n)
#   if n <= 10 
#     return n 
#   else
#     num_str = n.to_s
#     num_sum = 0
#     num_str.each_char { |num_char| num_sum += num_char.to_i }
#   end 
#   num_sum
# end 

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alpha = ("a".."z").to_a
  alphabet ||= alpha
  new_str = ""
  indices = []
  str.each_char do |char|
    indices << alpha_i = alphabet.index(char) 
  end 
  indices.sort! 
  indices.each do |idx|
    new_str += alphabet[idx]
  end 
  new_str
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    pairs = []
    self.each_with_index do |num, start_i|
      (start_i+1...self.length).each do |end_i|
        if self[start_i] + self[end_i] == 0
          pairs << [start_i, end_i]
        end 
      end 
    end 
    pairs 
  end

end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    matches = []
    dictionary.each do |word|
      if self.include?(word)
        matches << word 
      end 
    end 
    matches
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = []
  (1..num).each do |factor|
    factors << factor if num % factor == 0
  end 
  factors
end
