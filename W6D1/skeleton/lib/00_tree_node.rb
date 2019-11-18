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

end