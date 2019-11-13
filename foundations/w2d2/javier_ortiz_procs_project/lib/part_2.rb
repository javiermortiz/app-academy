def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    words = str.split(' ')
    words.map!(&prc)
    words.join(' ')
end

def greater_proc_value(num, proc_1, proc_2)
    [proc_1.call(num),  proc_2.call(num)].max
end

def and_selector(arr, proc_1, proc_2)
    arr.select { |el| proc_1.call(el) && proc_2.call(el) }
end

def alternating_mapper(arr, proc_1, proc_2)
    new_arr = []
    arr.each_with_index do |el, i|
        if i % 2 == 0
            new_arr << proc_1.call(el)
        else  
            new_arr << proc_2.call(el)
        end 
    end 
    new_arr
end