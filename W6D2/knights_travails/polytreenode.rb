class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end 

    def parent=(parent)
        if self.parent
            self.parent.children.delete(self)
        end 
        @parent = parent 
        self.parent.children << self unless self.parent.nil?
    end 

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil

        if !@children.include?(child_node)
            raise "this is not a child!"
        end
    end

    def dfs(target_value)
        @children.each do |child|
            current_node = child.dfs(target_value)
            return current_node unless current_node.nil?
        end 
        return self if @value == target_value 
        nil 
    end 

    def bfs(target_value)
        queue = [self]

        until queue.empty?
           current_node = queue.shift
           return current_node if current_node.value == target_value
           current_node.children.each { |child| queue << child }
        end
        
    end 

    def to_s
        self.value 
    end 

    def inspect 
        self.value
    end 
end

