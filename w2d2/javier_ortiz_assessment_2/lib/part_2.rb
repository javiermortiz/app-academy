def proper_factors(num)
    (1...num).select { |el| num % el == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(n)
    i = 0
    ideal_nums = []
    prospect = 1
    while i < n
        if perfect_number?(prospect)
            ideal_nums << prospect 
            i += 1
            prospect += 1
        else  
            prospect += 1
        end 
    end 
    ideal_nums
end