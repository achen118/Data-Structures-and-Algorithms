# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
class TreeNode
  attr_reader :value
  attr_accessor :left, :right, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @left = nil
    @right = nil
  end

  def append_left(value)
    @left = TreeNode.new(value)
    @left.parent = self
    @left
  end

  def append_right(value)
    @right = TreeNode.new(value)
    @right.parent = self
    @right
  end

  def children
    children = []

    children << @left if @left
    children << @right if @right

    children
  end

end

class BinaryTree
  attr_accessor :root

  def initialize(value)
    @root = TreeNode.new(value)
  end

end
