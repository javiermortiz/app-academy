require_relative "polytreenode"

class KnightPathFinder
    attr_reader :starting_pos, :considered_pos
    attr_accessor :root_node
    
    MOVES = [[1,2], [1,-2], [2,1], [2,-1], [-1,-2], [-1, 2], [-2,-1], [-2,1]]
    
    def initialize(starting_pos)
        @starting_pos = starting_pos
        @considered_pos = [starting_pos]
        self.build_move_tree(starting_pos)
    end 

    def build_move_tree(starting_pos)
        self.root_node = PolyTreeNode.new(starting_pos)

        queue = [root_node]
        until queue.empty?
            current_node = queue.shift

            current_pos = current_node.value
            self.new_move_positions(current_pos).each do |next_pos|
                child_node = PolyTreeNode.new(next_pos)
                current_node.add_child(child_node)
                queue << child_node
            end

        end 
    end 

    def self.valid_moves(pos)
       possible_pos = []
       x, y = pos
       MOVES.each do |new_x, new_y|
            possible_move = [new_x + x, new_y + y]
            possible_pos << possible_move if possible_move.all? {|el| el >= 0 && el <= 7}
       end 
       possible_pos
    end
    
    def new_move_positions(pos)  
        valid_moves = KnightPathFinder.valid_moves(pos)
        valid_move = valid_moves.select {|move| !@considered_pos.include?(move)}
        valid_move.each {|move| @considered_pos << move}
    end

    def find_path(end_pos)
        end_node = self.root_node.bfs(end_pos)
        trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        path = []
        until end_node.nil?
            path << end_node.value 
            end_node = end_node.parent
        end 
        path.reverse
    end 
end 

kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

# [0,4] = 2,5 , -2, 3
# MOVES = [ [2, 1]], [-2, -1]