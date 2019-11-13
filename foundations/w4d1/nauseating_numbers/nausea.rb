def pretentious_primes(numbers, n)
    numbers.map { |num| get_next_prime(num, n)}
end 

def get_next_prime(num, n)
    step = 1
    if n < 0 
        step = -(step)
        n = -(n)
    end 
    prime_count = 0
    while prime_count < n 
        num += step 
        return nil if num < 0
        prime_count += 1 if prime?(num)
    end 
    num 
end 

def prime?(num)
    return false if num < 2
    (2...num).none? { |el| num % el == 0}
end 

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]


def consecutive_collapse(numbers)
    numbers.length.times { numbers = collapse(numbers)}
    numbers 
end 

def collapse(numbers)
    (0...numbers.length-1).each do |i|
        if numbers[i]+1 == numbers[i+1] || numbers[i] == numbers[i+1]+1
            return numbers[0...i] + numbers[i+2..-1]
        end 
    end 
    numbers 
end 

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []
