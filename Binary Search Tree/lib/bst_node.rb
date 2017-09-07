class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent, :depth

  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end

  def less_than?(other_node)
    value <= other_node.value
  end

  def children
    children = []
    children << @left if @left
    children << @right if @right

    children
  end

  def siblings?
    @parent.children.length == 2
  end

  def append_to(parent)
    # assign the parent node of the child
    @parent = parent

    # assign child node of parent
    less_than?(parent) ? parent.left = self : parent.right = self
    #return value for convenience
    value
  end

  def replace(deleted_node)
    @parent = deleted_node.parent
    @left, @right = deleted_node.left, deleted_node.right

    @parent.left = self
  end

end
