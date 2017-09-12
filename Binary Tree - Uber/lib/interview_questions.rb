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

def max_path_sum(bst)
end

# ____________________________________________________________________
# Problem 3: Array is Possible Pre-order
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 4: Full or Nah?
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 5: Bottom View Binary Tree
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 6: Print Nodes in Top View of Binary Tree
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 7: Remove paths greater than length k
# ____________________________________________________________________

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

# ____________________________________________________________________
# Problem 10: Reverse Alternate Levels of a perfect BST
# ____________________________________________________________________






# ____________________________________________________________________
# test cases
# ____________________________________________________________________

bst = BinarySearchTree.new
[5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
  bst.insert(el)
end

root = bst.root
#############################
# bst looks like:           #
#             (5)           #
#            /   \          #
#          (3)   (7)        #
#         /  \      \       #
#      (1)   (4)    (9)     #
#     /   \            \    #
#   (0)   (2)          (10) #
#        /                  #
#      (1.5)                #
#############################

bst2 = BinarySearchTree.new
[5, 3, 7, 4].each do |el|
  bst2.insert(el)
end

root2 = bst2.root
#############################
# bst2 looks like:          #
#             (5)           #
#            /   \          #
#          (3)   (7)        #
#            \              #
#            (4)            #
#                           #
#############################



# ____________________________________________________________________
# Problem 1: Minimum Depth

p 'Problem 1: Minimum Depth'
p 'test 1'
p minimum_depth(root) == 2
p minimum_depth(root2) == 1
p 'test 2'
p maximum_depth(root) == 4
p maximum_depth(root2) == 2


# ____________________________________________________________________
# Problem 2: Maximum Depth

# ____________________________________________________________________
# Problem 3: Array is Possible Pre-order

# ____________________________________________________________________
# Problem 4: Full or Nah?

# ____________________________________________________________________
# Problem 5: Bottom View Binary Tree

# ____________________________________________________________________
# Problem 6: Print Nodes in Top View of Binary Tree

# ____________________________________________________________________
# Problem 7: Remove paths greater than length k

#____________________________________________________________________
# Problem 8: Lowest Common Ancestor



p 'Problem 8: LCA'
node1 = bst.find(1.5)
node2 = bst.find(4)
target = bst.find(3)

p 'test 1'
p lca(bst, node1, node2) == target


node1 = bst.find(1.5)
node2 = bst.find(10)
target = bst.find(5)

p 'test 2'
p lca(bst, node1, node2) == target


node1 = bst.find(1.5)
node2 = bst.find(2)
target = bst.find(2)

p 'test 3'
p lca(bst, node1, node2) == target


node1 = bst.find(1.5)
node2 = bst.find(1.5)
target = bst.find(1.5)

p 'test 4'
p lca(bst, node1, node2) == target

# ____________________________________________________________________
# Problem 9: Subtree of another BST?

# ____________________________________________________________________
# Problem 10: Reverse Alternate Levels of a Perfect BST
