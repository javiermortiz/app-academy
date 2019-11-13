def hipsterfy(word)
    reversed = word.split('').reverse
    vowels = 'aeiou'
    reversed.each_with_index do |l, i|
        if vowels.include?(l)
            reversed[i] = ''
            break
        end
    end
    reversed.reverse.join('')
end


def vowel_counts(str)
    hash = Hash.new(0)
    letters = str.split('')
    letters = letters.map { |l| l.downcase}
    letters.each { |l| hash[l] += 1}
    hash
end


def caesar_cipher(message, n)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    letters = message.split('')
    letters.map! do |l|
        if alphabet.include?(l)
            current_pos = alphabet.index(l)
            new_pos = (current_pos + n) % 26
            alphabet[new_pos]
        else
            l
        end
    end
    letters.join('')
end