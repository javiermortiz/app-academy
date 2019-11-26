def my_min_1(arr)
    arr.each do |og|
        return og if arr.all? { |ele1| og <= ele1  }
    end 
end 

# list = [ 0, 3, 5, 4, -5, 10, 1, 90]
# p my_min_1(list)

# O(n^2)
# O(1)

def my_min_2(arr)
    min = arr.first
    arr.each do |ele|
        min = ele if ele < min 
    end 
    min 
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90]
# p my_min_2(list)

# O(n)
# O(1)

def largest_contiguous_subsum_1(arr)
    sums = []
    arr.each_with_index do |ele1, idx|
        (idx...arr.length).each do |idx2|
            sums << arr[idx..idx2]
        end
    end
    sums.map(&:sum).max
end 

# list = [ 5, 3, -7]
# p largest_contiguous_subsum1(list)

# O(n^3)
# O(n)

# def largest_contiguous_subsum(arr)
#   largest = arr.first
#   i = 0
#   while i < arr.length ||
#     current_sum = arr[0..i].sum
#     largest = current_sum if current_sum > largest
#     i += 1
#   end
#   largest
# end

def largest_contiguous_subsum(arr)  # [-5, -1, -3]
    current = arr.first
    max = arr.first
    
    # return arr.max if arr.all? { |num| num < 0 }
    # current = 0 if current < 0
    arr.drop(1).each do |el|
        current += el  
        current = el if current < 0
        max = current if current > max 
    end 
    max
end 

#O(n)
#O(1)

# list = [-6, 5, 3, -7]
# current = 8
# max = 7
list = [5, 3, -7]
p largest_contiguous_subsum(list)

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-1, -5, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])

# p largest_contiguous_subsum(list)