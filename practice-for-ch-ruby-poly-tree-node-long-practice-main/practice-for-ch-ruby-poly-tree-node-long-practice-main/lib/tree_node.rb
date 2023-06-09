class PolyTreeNode

    attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent=nil)
    unless @parent
        @parent = new_parent
        new_parent.children << self
        return
    end
    self.parent.children.select! {|ele| ele != self}
    (new_parent.children << self) if new_parent && !new_parent.children.include?(self)
    @parent = new_parent

  end

  def add_child(child)
    (self.children << child) if self.children.include?(child)
    child.parent = self
  end

  def remove_child(child)
    child.parent = nil
  end
  
  def dfs(target)
    return self if self.value == target
    self.children.each do |child| 
      result = child.dfs(target)
      return result if !result.nil?
    end
    return nil if self.children.empty?
  end

  def bfs(target)
    arr = [self]
    until arr.empty?
      node = arr.shift
      return node if node.value == target
      arr.concat(node.children)
    end
    nil
  end

end