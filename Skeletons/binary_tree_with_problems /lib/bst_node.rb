class BSTNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end

  def less_than?(other_node)
    @value <= other_node.value
  end

  def append_to(parent)
    @parent = parent

    less_than?(parent) ? parent.left = self : parent.right = self

    value
  end

  def children
    children = []

    children << @left if @left
    children << @right if @right

    children
  end

  def sibling?
    @parent.children.length == 2
  end

  def replace(deleted)
    @parent = deleted.parent
    @left, @right = deleted.left, deleted.right

    @parent.left = self
  end

  def depth
    counter = 0
    current_node = self
    until current_node.parent.nil?
      counter += 1
      current_node = current_node.parent
    end
    counter
  end

end
