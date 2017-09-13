

def kth_largest(tree_node, k)
  counter = {count: 0, current_node: nil}
  reverse_traversal(tree_node, k, counter)[:current_node]
end

def reverse_traversal(tree_node, k, counter)
  if tree_node && counter[:count] < k
    counter = reverse_traversal(tree_node.right, k, counter)
    
    if counter[:count] < k
      counter[:count] += 1
      counter[:current_node] = tree_node
    end

    if counter[:count] < k
      counter = reverse_traversal(tree_node.left, k, counter)
    end

  end

  counter
end































# def kth_largest(tree_node, k)
#   counter = {count: 0, current_node: nil}
#   reverse_traversal(tree_node, k, counter)[:current_node]
# end
#
# def reverse_traversal(tree_node, k, counter)
#
#   if tree_node && counter[:count] < k
#   # make the recursive call here to go all the way to the right before
#   # working your way back up
#     counter = reverse_traversal(tree_node.right, k, counter)
#
#   # once you've worked your way all the way to the right,
#   # work your way back up
#
#   # if the count is less than k...
#     if counter[:count] < k
#       # increment the counter...
#       counter[:count] += 1
#       # reassign the current_node...
#       counter[:current_node] = tree_node
#     end
#
#     # and if the counter is still less than k, then make the recursive call on the left child.
#     if counter[:count] < k
#       counter = reverse_traversal(tree_node.left, k, counter)
#     end
#   end
#
#   counter
# end
