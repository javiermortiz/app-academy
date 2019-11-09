def my_reject(arr, &prc)
    new_arr = []
    arr.each { |el| new_arr << el if !prc.call(el)}
    new_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count == 1
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each { |k, v| new_hash[k] = v if prc.call(k,v)}
    new_hash
end

def xor_select(arr, proc_1, proc_2)
    arr.select do |el|
        (proc_1.call(el) && !proc_2.call(el)) || (!proc_1.call(el) && proc_2.call(el))
    end
end

def proc_count(val, arr)
    count = 0
    arr.each { |proc| count += 1 if proc.call(val) }
    count
end