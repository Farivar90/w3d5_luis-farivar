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
        arr
    end

    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
        @position = position
    end

    def new_move_position(position)
        new_move_position = KnightPathFinder.valid_moves(position)
        new_move_position.select! {|el| !@considered_positions.include?(el)}
        @considered_positions += new_move_position
        return new_move_position
    end

    def build_move_tree(target)
        pos = @root_node.value
        current = @root_node
        arr = Array.new
        loop do 
          new_move_position(pos).each do |new_pos| 
            arr.push(new_pos)
            new_node = PolyTreeNode.new(new_pos)
            current.add_child(new_node)
            new_node.parent = current
          end
          break if arr.include?(target)
          break if arr.empty?
          pos = arr.shift
          current = # FIGURE OUT HOW TO CHANGE CURRENT!
        end

        @root_node

    end

    
end