def range(start, end_val)
    return [] if end_val <= start
    [start] + range(start+1, end_val)

end


def iterative_sum(arr)
    sum = 0
    arr.each { |num| sum += num }
    sum
end


def recursive_sum(arr)
    return arr.first if arr.length <= 1

    arr.first + recursive_sum(arr[1..-1])
end


def exp_1(b, n)
    return 1 if n == 0
    b * exp_1(b, n-1)
end 


def exp_2(b, n)
    return 1 if n == 0
    if n.even?
        exp_2(b, n / 2) ** 2
    else 
        b * (exp_2(b, (n-1) / 2) ** 2)
    end 
end 


def deep_dup(arr)
    arr.map do |el| 
        if el.is_a?(Array)
            deep_dup(el)
        else  
            el  
        end 
    end
end


def fibonacci(n)
    return [0, 1].take(n) if n <= 2 
    prev_fib = fibonacci(n-1)
    last_num = prev_fib[-1] + prev_fib[-2]
    prev_fib << last_num
end

def bsearch(arr, target) 
    return nil if arr.length == 1 && arr.first != target
    middle_idx = arr.length / 2
    middle_num = arr[middle_idx]
 
    return middle_idx if middle_num == target

    if target < middle_num
        bsearch(arr[0...middle_idx], target)
    else
        result = bsearch(arr[middle_idx..-1], target)
        return nil if result == nil
        middle_idx + result 
    end
end


def merge_sort(arr)
    return arr if arr.length <= 1
    middle_idx = arr.length / 2
    left = arr[0...middle_idx]
    right = arr[middle_idx..-1]
    merge(merge_sort(left), merge_sort(right))
end 

def merge(left, right) 
    arr = []
    i = 0
    j = 0
    while i < left.length 
        if  right[j] == nil || left[i] <= right[j]
            arr << left[i]
            i += 1
        elsif left[i] == nil || left[i] > right[j] 
            arr << right[j]
            j += 1
        end
    end
    arr += right[j..-1]
end


def subsets(arr) 
    return [[]] if arr.empty?
    result = subsets(arr[0...arr.length-1]) 
    result += result.map { |sub| sub + [arr.last] }
end 


def greedy(amt, coins)   
    change = []
    return change if coins.empty?
    p coins
    while amt >= coins[0]
        change << coins[0] 
        amt -= coins[0]
    end 
    change += greedy(amt, coins[1..-1])
    change
end


def change(amt, coins=[25,10,5,1]) 
    return [] if amt == 0
    best_change = nil 
    coins.each do |coin|
        next if coin > amt 

        change_array = [coin] + change(amt-coin, coins)

        if best_change.nil? || change_array.count < best_change.count 
            best_change = change_array 
        end 
    end 
    best_change 

end 