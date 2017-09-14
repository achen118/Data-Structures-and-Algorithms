require_relative 'binary_search_tree'
require_relative 'binary_tree'
# ____________________________________________________________________
# Problem 1: Minimum / Maximum Depth
# ____________________________________________________________________

def minimum_depth(tree_node)
  queue = [tree_node]

  until queue.empty?
    current_node = queue.shift
    return current_node.depth if current_node.children.empty?
    queue.concat(current_node.children)
  end

end

def maximum_depth(tree_node)
  return 0 unless tree_node
  return 0 if tree_node.children.empty?
  # p 'current_node'
  # p tree_node.value
  depths = [maximum_depth(tree_node.left), maximum_depth(tree_node.right)]
  max_depth = depths.max
  max_depth + 1
end
# ____________________________________________________________________
# Problem 2: Maximum Path Sum
# ____________________________________________________________________

def max_path_sum(bt)
  max_hash = { max_path: 0, max_single: 0}
  result_hash = max_path_finder(bt.root, max_hash)
  result_hash[:max_single]
end

def max_path_finder(tree_node, max_hash)
  return max_hash unless tree_node

  left_single = max_path_finder(tree_node.left, max_hash)[:max_single]
  right_single = max_path_finder(tree_node.right, max_hash)[:max_single]

  max_single = [left_single, right_single].max
  max_hash[:max_single] = [max_single + tree_node.value, tree_node.value].max


  new_max_path = [max_single, left_single + right_single + tree_node.value].max
  max_hash[:max_path] = [max_hash[:max_path], new_max_path].max

  max_hash
end


# ____________________________________________________________________
# Problem 3: Array is Possible Pre-order
# ____________________________________________________________________

def possible_pre_order?(array)
  stack = []
  current_root = array.min - 1

  array.each do |el|
    return false if el < current_root

    while !stack.empty? && el > stack[-1]
      current_root = stack.pop
    end

    stack << el
  end

  true
end
# ____________________________________________________________________
# Problem 4: Full or Nah?
# ____________________________________________________________________

def full_tree?(tree_node)
  return true unless tree_node
  return true if tree_node.children.empty?
  return false if tree_node.children.length == 1
  full_tree?(tree_node.left) && full_tree?(tree_node.right)
end

# ____________________________________________________________________
# Problem 5: Bottom View Binary Tree
# ____________________________________________________________________

def bottom_view(root)
  tree_map = {}
  queue = [[root, 0]]

  until queue.empty?
    node, level = queue.shift
    tree_map[level] = node.value
    queue << [node.left, level - 1] if node.left
    queue << [node.right, level + 1] if node.right
  end


  tree_map.keys.sort.map { |level| tree_map[level] }
end






# ____________________________________________________________________
# Problem 6: Print Nodes in Top View of Binary Tree
# ____________________________________________________________________

def top_view(root)
  tree_map = {}
  queue = [[root, 0]]

  until queue.empty?
    node, level = queue.shift
    tree_map[level] = node.value unless tree_map[level]
    queue << [node.left, level - 1] if node.left
    queue << [node.right, level + 1] if node.right
  end

  tree_map.keys.sort.map { |level| tree_map[level] }
end

# ____________________________________________________________________
# Problem 7: Remove paths less than length k
# ____________________________________________________________________




# # # _____ CODE GRAVEYARD ______ # # #

def limit_path_length(binary_tree, k)
  tree_map = Hash.new { |hash, key| hash[key] = 0 }
  leaves = []
  queue = [binary_tree.root]

  until queue.empty?
    node = queue.shift
    if node.children.empty?
      leaves << node
    else
      node.children.each { |child| queue << child }
    end
  end

  leaves.each do |leaf|
    node = leaf
    value, depth = leaf.value, leaf.depth + 1
    until node.parent.nil?
      tree_map[node.value] = [tree_map[node.value], depth].max
      node = node.parent
      tree_map[node.value] = [tree_map[node.value], depth].max if node.parent.nil?
    end
  end

  nodes_to_remove = tree_map.select { |_key, path_length| path_length < k }.keys

  until nodes_to_remove.empty?
    node = nodes_to_remove.shift
    if node == binary_tree.root && !nodes_to_remove.empty?
      queue << node
      node = nodes_to_remove.shift
    end

    binary_tree.delete(node)
  end

  binary_tree
end

# ____________________________________________________________________
# Problem 8: Lowest Common Ancestor
# ____________________________________________________________________

    # In a binary search tree, an *ancestor* of a `example_node` is a node
    # that is on a higher level than `example_node`, and can be traced directly
    # back to `example_node` without going up any levels. (I.e., this is
    # intuitively what you think an ancestor should be.) Every node in a binary
    # tree shares at least one ancestor -- the root. In this exercise, write a
    # function that takes in a BST and two nodes, and returns the node that is the
    # lowest common ancestor of the given nodes. Assume no duplicate values.

def lca(bst, node1, node2)
  #first find depth of both
  depth1, depth2 = node1.depth, node2.depth

            # worst case: N
            # average case: worse than logN

  difference = depth1 - depth2

  current_node1, current_node2 = node1, node2
  # find the parent of the deeper node that's at the same depth as the
  # shallower node

  if difference > 0
    difference.times do
      current_node1 = current_node1.parent
    end
  else difference < 0
    difference.abs.times do
      current_node2 = current_node2.parent
    end
  end

          # worst case: N
          # average case: better than logN

  until current_node1 == current_node2
    current_node1 = current_node1.parent
    current_node2 = current_node2.parent
  end

        # worst case: N / 2
        # average case: better than logN
  current_node1
end


# ____________________________________________________________________
# Problem 9: Subtree of another BST?
# ____________________________________________________________________

def valid_subtree?(root1, root2)

end

# ____________________________________________________________________
# Problem 10: Reverse Alternate Levels of a perfect BST
# ____________________________________________________________________


def search_tree?(root)
  return true unless root

  left, right = root.left, root.right
  
  if left
    return false unless left.value <= root.value
  end
  if right
    return false unless right.value > root.value
  end

  search_tree(root.left) && search_tree(root.right)
end
