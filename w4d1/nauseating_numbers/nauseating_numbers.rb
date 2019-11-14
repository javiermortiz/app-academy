require "byebug"
def strange_sums(arr)
    count = 0
    (0...arr.length-1).each do |start_i|
        (start_i+1...arr.length).each do |end_i|
            if arr[start_i] + arr[end_i] == 0
                count += 1
            end 
        end 
    end 
    count
end 

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, product)
    (0...arr.length-1).each do |start_i|
        (start_i+1...arr.length).each do |end_i|
            if arr[start_i] * arr[end_i] == product
                return true
            end 
        end 
    end 
    false
end 

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
    new_str = ''
    letters.each_char do |l|
        if hash.has_key?(l)
            new_str += l * hash[l]
        else  
            new_str += l 
        end 
    end 
end 

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def perfect_square?(num)
    (1..num).each do |el|
        if el * el == num 
            return true 
        end 
    end 
    false 
end 

# p perfect_square?(1)     # true
# p perfect_square?(4)     # true
# p perfect_square?(64)    # true
# p perfect_square?(100)   # true
# p perfect_square?(169)   # true
# p perfect_square?(2)     # false
# p perfect_square?(40)    # false
# p perfect_square?(32)    # false
# p perfect_square?(50)    # false


def anti_prime?(num)
    (1...num).each do |el|
        return false if get_divisors(num) < get_divisors(el)
    end 
    true 
end 

def get_divisors(n)
    (1..n).count { |divisor| n % divisor == 0 }
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false


def matrix_addition(matrix_1, matrix_2)
    new_matrix = Array.new(matrix_1.length) { Array.new(matrix_1[0].length)}
    (0...matrix_1.length).each do |i|
        (0...matrix_1[0].length).each do |j|
            new_matrix[i][j] = matrix_1[i][j] + matrix_2[i][j]
        end 
    end 
    new_matrix
end 

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]


def mutual_factors(*nums)
    min = nums.min
    (1..min).select do |el|
        nums.all? { |num| num % el == 0}
    end 
end 

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]


def tribonacci_number(n)
    if n == 1 || n == 2
        return 1
    elsif n == 3
        return 2
    end 

    tribo = [1, 1, 2]
    i = 3
    while i < n
        tribo << get_next_tribo(tribo)
        i += 1
    end 
    tribo.last 
end 

def get_next_tribo(arr)
    arr[-1] + arr[-2] + arr[-3]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274


def matrix_addition_reloaded(*matrices)
    result = matrices.all? { |matrix| matrix.length == matrices[0].length}
    return nil if !result
    new_matrix = Array.new(matrices[0].length) { Array.new(matrices[0][0].length, 0)}
    (0...matrices.length).each do |m|
        matrix = matrices[m]
        (0...matrix.length).each do |i|
            (0...matrix[0].length).each do |j|
                new_matrix[i][j] += matrix[i][j]
            end 
        end 
    end 
    new_matrix
end 

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]


# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil


def squarocol?(arr)
    rows = arr.any? do |sub|
        sub.all? { |el| el == sub[0] }
    end 
    cols = false
    (0...arr[0].length).each do |el_i|
        col = []
        (0...arr.length).each do |sub_i|
            col << arr[sub_i][el_i]
        end 
        col_result = col.all? {|el| el == col[0]}
        cols = true if col_result
    end
    return rows || cols
end 

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


def squaragonal?(arr)
    diagonal_1 = get_diagonal_1(arr)
    diagonal_2 = get_diagonal_2(arr)
    result_1 = diagonal_1.all? { |el| el == diagonal_1[0]}
    result_2 = diagonal_2.all? { |el| el == diagonal_2[0]}
    return result_1 || result_2
end 

def get_diagonal_1(arr)
    diagonal = []
    arr.each_with_index do |sub, i|
        diagonal << sub[i]
    end 
    diagonal 
end 

def get_diagonal_2(arr)
    diagonal = []
    arr.each_with_index do |sub, i|
        diagonal << sub[-i-1]
    end 
    diagonal 
end     


# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false


def pascals_triangle(n)
    if n == 1
        return [[1]]
    elsif n == 2
        return [[1], [1, 1]]
    end 
    triangle = [[1], [1, 1]]
    i = 2
    while i < n 
        triangle << next_level(triangle)
        i += 1
    end 
    triangle 
end 

def next_level(arr)
    previous_level = arr.last
    new_level = []
    (0...previous_level.length-1).each do |i|
        new_level << previous_level[i] + previous_level[i+1]
    end 
    new_level.unshift(1)
    new_level.push(1)
    new_level
end 


# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]


def mersenne_prime(n)
    mersenne = []
    count = 0
    num = 1
    while count < n
        if is_mersenne?(num)
            mersenne << num 
            count += 1
            num += 1
        else  
            num += 1
        end
    end 
    mersenne.last 
end 

def is_mersenne?(num)
    is_prime?(num) && is_2_power?(num + 1)
end

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |el| num % el == 0}
end 

def is_2_power?(num)
    # x = 0
    # (0..num).each do |exp|
    #     return true if 2**exp == num 
    # end
    # false 
    until num == 1 || num.odd?
        num = num / 2
    end 
    if num == 1
        return true 
    else 
        return false 
    end 
end 


# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071


def triangular_word?(word)
    word_n = get_word_n(word)
    return is_triangular?(word_n)
end 

def get_word_n(word)
    alphabet = ('a'..'z').to_a
    val = 0
    word.each_char do |char|
        val += alphabet.index(char) + 1
    end 
    val 
end 

def is_triangular?(num)
    i = 1
    triangular = 1
    while triangular < num 
        triangular = (i * (i + 1)) / 2
        if triangular == num
            return true 
        end 
        i += 1
    end 
    false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false


def consecutive_collapse(arr)
    collapsed = false
    while !collapsed
        collapsed = true 
        (0...arr.length-1).each do |i|
            diff = arr[i] - arr[i+1]
            if diff == 1 || diff == -1
                arr.delete_at(i)
                arr.delete_at(i)
                collapsed = false 
                break
            end 
        end 
    end 
    arr
end 


# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

 
def pretentious_primes(arr, n)
    if n > 0
        arr.map! do |el|
            n.times { el = get_next_prime(el) }
            el  
        end 
    else  
        n *= -1
        arr.map! do |el|
            n.times { el = get_prev_prime(el) }
            el  
        end
    end  
    arr 
end 

def get_prev_prime(n)
    return nil if n == nil || n <= 2
    n -= 1
    while !is_prime?(n)
        n -= 1
    end 
    n
end 

def get_next_prime(n)
    n += 1
    while !is_prime?(n)
        n += 1
    end 
    n
end 

def is_prime?(n)
    return false if n < 2
    (2...n).none? { |el| n % el == 0}
end 

#debugger
p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]