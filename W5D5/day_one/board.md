class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end 
        self 
    end

end 


def bsearch(arr, target)  
    return nil if arr.length == 1 && arr.first != target
    middle_idx = arr.length / 2
    if arr[middle_idx] == target
        return middle_idx
    elsif arr[middle_idx] > target
        bsearch(arr[0...middle_idx], target)
    else 
        result = bsearch(arr[middle_idx+1..-1], target)
        if result.nil?
            return nil
        else 
            middle_idx + result + 1
        end
    end 
end


def digital_root(num)
    return num if num < 10
    sum_digit = digital_root_step(num)
    digital_root(sum_digit)
end 

def digital_root_step(num)
    return num if num < 10
    first_digit = num % 10 
    first_digit + digital_root_step(num/10)
end 


