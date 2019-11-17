class Stack
    def initialize
        @stack = []
    end 

    def push(el)
        @stack << el
    end 

    def pop
        @stack.pop 
    end 

    def peek
        return @stack.last
    end 
end 

p "This is the stack class"
p my_stack = Stack.new
p my_stack.push(1)
p my_stack.pop
p my_stack.push(1)
p my_stack.push(2)
p my_stack.peek
p ".............."

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end 

    def dequeue
        @queue.shift
    end 

    def peek
        @queue.first
    end
end 

p "This is the queue class"
p my_queue = Queue.new
p my_queue.enqueue(1)
p my_queue.dequeue
p my_queue.enqueue(1)
p my_queue.enqueue(2)
p my_queue.peek
p ".............."

class Map
    def initialize
        @map = []
    end 

    def set(key, value)
        @map.each do |pair|
            if pair[0] == key
                pair[1] = value 
                return 
            end 
        end 
        @map << [key, value]
    end 

    def get(key)
        @map.each do |pair|
            return pair[1] if pair[0] == key 
        end 
        nil 
    end 

    def delete(key)
         @map.each do |pair|
            @map.delete(pair) if pair[0] == key 
        end 
    end 
end 
p "This is the map class."
p my_map = Map.new
p my_map.set(:a, 1)
p my_map.set(:a, 10)
p my_map.get(:a)
p my_map.delete(:a)
p my_map.get(:a)
p "................"
