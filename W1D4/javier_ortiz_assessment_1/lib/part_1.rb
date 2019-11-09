def is_prime?(num)
    if num < 2
        return false
    end 
    (2...num).each do |factor|
        if num % factor == 0
            return false 
        end 
    end 
    true
end


def nth_prime(n)
    prime_count = 0
    num = 0
    while prime_count < n
        num += 1
        if is_prime?(num)
            prime_count += 1
        end 
    end 
    num
end


def prime_range(min, max)
    (min..max).select { |el| is_prime?(el)}
end