require_relative 'binary_search_tree'

# ____________________________________________________________________
# Problem 1: Minimum Depth
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 2: Maximum Depth
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 3: Array is Possible Pre-order
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 4: Full or Nah?
# ____________________________________________________________________

# ____________________________________________________________________
# Problem 5: Bottom View Binary Tree
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
  depth1, depth2 = node1.depth(bst), node2.depth(bst)

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
# Problem 2: Maximum Depth
# ____________________________________________________________________





# ____________________________________________________________________
# test cases
# ____________________________________________________________________

bst = BinarySearchTree.new
[5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
  bst.insert(el)
end

#############################
# prefilled_bst looks like: #
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
