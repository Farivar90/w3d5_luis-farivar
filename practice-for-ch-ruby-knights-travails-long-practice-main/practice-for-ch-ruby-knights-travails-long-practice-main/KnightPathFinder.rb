require_relative 'tree_node.rb'

class KnightPathFinder

    attr_accessor :position
    
    def self.valid_position?(position)
        (position.all? {|ele| ele >= 0 && ele <= 7})
    end

    def self.valid_moves(position)
        arr = []
        m1 = position[0] + 1 , position[1] + 2
        m2 = position[0] + 2 , position[1] + 1
        m3 = position[0] + 2 , position[1] - 1
        m4 = position[0] + 1 , position[1] - 2
        m5 = position[0] - 1 , position[1] - 2
        m6 = position[0] - 2 , position[1] - 1
        m7 = position[0] - 2 , position[1] + 1
        m8 = position[0] - 1 , position[1] + 2
        arr << m1 << m2 << m3 << m4 << m5 << m6 << m7 << m8
        arr.select! {|ele| KnightPathFinder.valid_position?(ele)}
    end

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        @position = position
        #@board = Array.new(8) {Array.new(8)}
    end

    
end