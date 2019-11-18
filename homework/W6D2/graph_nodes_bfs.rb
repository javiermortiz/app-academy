require "set"

class GraphNode
    attr_reader :value
    attr_accessor :neighbors 
    def initialize(value)
        @value = value 
        @neighbors = []
    end 
end 

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited_nodes = Set.new() 
    until queue.empty?
        current_node = queue.shift
        if current_node.value == target_value 
            return current_node
        else  
            visited_nodes << current_node
        end 
        current_node.neighbors.each do |neighbor|
            queue << neighbor unless visited_nodes.include?(neighbor)
        end 
    end 
end 

p bfs(a, "b")
p bfs(a, "f")
