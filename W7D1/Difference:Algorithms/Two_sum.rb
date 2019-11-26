def bad_two_sum?(arr, target_sum)
    (0...arr.length-1).each do |idx1|
        (idx1+1...arr.length).each do |idx2|
            return true if arr[idx1] + arr[idx2] == target_sum
        end 
    end 
    false 
end

# O(n^2)

def okay_two_sum?(arr, target_sum)
    arr.sort!
    i = 0
    j = arr.length-1

    until i == j
        current_sum = arr[i] + arr[j]
        return true if current_sum == target_sum
        j -= 1 if current_sum > target_sum
        i += 1 if current_sum < target_sum
    end
    false
end
# [-5, -3, -2, 0, 1, 5, 6, 7, 8]  => 9
# [0, 1, 4, 6, 8, 15]  => 11

#O(n log n)

def two_sum?(arr, target_sum)
  hash = {}
    arr.each do |el|
        hash[el] = el
        return true if hash.has_value?(target_sum - el)
    end 
    false
end

#O(n)
# arr = [0, 8, 5, 7, 0, 1, 5, 7, 8, -5, -3, -2, 0, 1, 5, 6, 7, 8]  
# arr_sorted = [0,0,0,0,0,0,0,1,1,1,1,1,1,2,2,2,2,2,2,2,3,3,3,3,3,4,4,4,4,4]
# arr = [0, 1, 5, 7, 9, 10]  => 16

arr_sorted = (0..100000000).to_a

start_ok = Time.now.to_f
p okay_two_sum?(arr_sorted, 1000) # true
# p okay_two_sum?(arr, 3) # false
end_ok = Time.now.to_f

p "ok sum"
diff_1 = end_ok - start_ok
p diff_1

start = Time.now.to_f
p two_sum?(arr_sorted, 1000) # true
# p two_sum?(arr, 3) # false
finish = Time.now.to_f

p "hash sum"
diff_1 = finish - start

p diff_1