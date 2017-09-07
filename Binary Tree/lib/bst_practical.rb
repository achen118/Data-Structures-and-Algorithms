require_relative 'binary_search_tree'

def maximum(tree_node)
  return tree_node unless tree_node.right

  maximum(tree_node.right)
end

def in_order_traversal(tree_node, arr = [])
  return [tree_node] unless tree_node.children

  left_sub, right_sub = tree_node.left, tree_node.right
  left_arr, right_arr = [], []

  left_arr.concat(in_order_traversal(left_sub)) if left_sub
  right_arr.concat(in_order_traversal(right_sub)) if right_sub

  left_arr + [tree_node] + right_arr
end


def kth_largest(tree_node, k)
  array = in_order_traversal(tree_node)
  array.length >= k ? array[-k] : nil
end
