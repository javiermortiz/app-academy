fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish_arr)
    longest = nil
    i = 0
    while i < fish_arr.length

        j = i + 1
        while j < fish_arr.length 

            if fish_arr[i].length >= fish_arr[j].length
                longest = fish_arr[i]
            else  
                longest = fish_arr[j]
            end 
            j += 1
        end 

        i += 1
    end 
    longest
end 

def dominant_octopus(arr)
    return arr if arr.length <= 1

    middle = arr.length / 2
    left, right = arr.take(middle), arr.drop(middle)
    sorted_left, sorted_right = dominant_octopus(left), dominant_octopus(right)

    merge(sorted_left, sorted_right)
end

def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
        if left.first.length < right.first.length 
            sorted << left.shift 
        else  
            sorted << right.shift 
        end 
    end 
    sorted + left + right 
end 


def clever_octopus(arr)
    longest = "a"
    i = 0
    while i < arr.length 
        longest = arr[i] if arr[i].length > longest.length 
        i += 1
    end 
    longest 

end 

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

tiles_hash = {"up"=>0, "right-up"=>1, "right"=>2, "right-down"=>3, "down"=>4, "left-down"=>5, "left"=>6,  "left-up"=>7 }

def slow_dance(move, arr)
    arr.each_with_index do |dir, i|
        return i if dir == move 
    end 
end 

def fast_dance(move, hash)
    hash[move]
end 