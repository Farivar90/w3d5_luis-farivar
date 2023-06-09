class PolyTreeNode

    attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    unless @parent
        @parent = new_parent
        new_parent.children << self
        return
    end


  end

end