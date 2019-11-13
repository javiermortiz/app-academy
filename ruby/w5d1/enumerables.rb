require "byebug"
class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end 
        self 
    end 

    def my_select(&prc)
        selected = []
        self.my_each do |el|
            selected << el if prc.call(el)
        end 
        selected 
    end 

    def my_reject(&prc)
        filtered = []
        self.my_each do |el|
            filtered << el unless prc.call(el)
        end 
        filtered 
    end 

    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end 
        false 
    end 

    def my_all?(&prc)
        self.my_each do |el|
            return false if !prc.call(el)
        end 
        true 
    end 

    def my_flatten
        flat = []
        self.my_each do |el|
            if !el.is_a?(Array)
                flat << el
            else 
                flat += el.my_flatten
            end 
        end 
        flat 
    end 

    def my_zip(*args)
        new_arr = Array.new(self.length) {Array.new()}
        i = 0
        while i < self.length
            new_arr[i] << self[i]
            args.each do |sub|
                new_arr[i] << sub[i] 
            end 
            i += 1
        end 
        new_arr
    end

    def my_rotate(amount = 1)
        new_arr = self.dup
        if amount > 0
            amount.times do 
                first_ele = new_arr.shift
                new_arr << first_ele 
            end
        else
            (-amount).times do
                last_ele = new_arr.pop
                new_arr.unshift(last_ele)
            end
        end
        new_arr
    end

    def my_join(sep = "")
        new_str = ""
        (0...self.length-1).each do |idx|
            new_str += self[idx] + sep 
        end 
        new_str += self[-1]
        new_str 
    end

    def my_reverse
        return self if self.length == 1
        new_arr = []
        new_arr.concat([self[-1]])
        new_arr += self[0...-1].my_reverse
        new_arr
    end

    def bubble_sort!(&prc)
        sorted = false 
        while !sorted 
            sorted = true 

            self.each_with_index do |el, i|
                if prc.call(self[i], self[i+1]) == 1 
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false 
                # elsif prc.call(self[i], self[i+=1]) == 1
                #     self[i+1], self[i] = self[i], self[i+1]
                #     sorted = false 
                #     p self 
                end 
            end 
        end 
        self 
    end

    def bubble_sort(&prc)
        new_arr = self.dup
        new_arr.bubble_sort!(&prc) 
    end
end 

def factors(num)
    new_arr = []
    (1..num).each do |factor|
      if num % factor == 0
        new_arr << factor 
      end 
    end 
    new_arr 
end

def substrings(string)
    new_arr = []
    string.each_char.with_index do |char, start_idx|
        (start_idx...string.length).each do |end_idx|
        new_arr << string[start_idx..end_idx]
        end 
    end 
    new_arr 
end

def subwords(word, dictionary)
    subs = substrings(word)
    subs.select { |sub| dictionary.include?(sub)} 
end
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]