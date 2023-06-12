require_relative 'tree_node.rb'

class KnightPathFinder

    attr_accessor :position , :considered_positions
    
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
        build_move_tree
    end

    def new_move_position(position)
        new_move_position = KnightPathFinder.valid_moves(position)
        new_move_position.select! {|el| !@considered_positions.include?(el)}
        @considered_positions += new_move_position
        return new_move_position
    end

    def build_move_tree
        current = @root_node
        arr = Array.new
        loop do 
          new_move_position(current.value).each do |new_pos| 
            new_node = PolyTreeNode.new(new_pos)
            arr.push(new_node)
            current.add_child(new_node)
          end
          break if arr.empty?
          current = arr.shift
        end
        nil
    end

    def find_path(target)
        @root_node.bfs(target)
    end

    def trace_path_back(target)
        return [target.value] if target.parent == nil
        res = find_path(target.parent)
        (trace_path_back(target.parent) << res.value) unless res
    end
    
end