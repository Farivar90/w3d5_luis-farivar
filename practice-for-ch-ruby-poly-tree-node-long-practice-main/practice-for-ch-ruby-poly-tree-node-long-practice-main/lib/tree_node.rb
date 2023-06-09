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

end