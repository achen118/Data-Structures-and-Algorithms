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
  p "result_hash = #{result_hash}"
  result = result_hash[:max_single]
  p "result = #{result}"
end

def max_path_finder(tree_node, max_hash)
  puts
  p max_hash
  return max_hash unless tree_node
  p tree_node.value
  puts

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
[5, 3, 7, 4, -1].each do |el|
  bst2.insert(el)
end

bst_max_path = [1.5, 2, 1, 3, 5, 7, 9, 10].reduce(:+)

root2 = bst2.root
#############################
# bst2 looks like:          #
#             (5)           #
#            /   \          #
#          (3)   (7)        #
#         /  \              #
#      (-1)  (4)            #
#                           #
#############################

bst2_max_path = [4, 3, 5, 7].reduce(:+)

bt = BinaryTree.new(10)
bt.root.append_left(2).append_left(20)
bt.root.append_right(10).append_right(-25).append_right(4)
bt.root.left.append_right(1)
bt.root.right.right.append_left(3)

#############################
# bt looks like:            #
#             (10)          #
#            /   \          #
#          (2)   (10)       #
#         /  \      \       #
#      (20)  (1)   (-25)    #
#                  /  \     #
#                (3)  (4)   #
#############################

bt_max_path = [20, 2, 10, 10].reduce(:+)

# ____________________________________________________________________
# Problem 1: Minimum Depth


p ' ---------- Problem 1: Depth ---------- '
puts
p 'Minimum Depth:'
p '~~ test 1 ~~'
p test1 = minimum_depth(root) == 2
p '~~ test 2 ~~'
p test2 = minimum_depth(root2) == 1
puts
p 'Maximum Depth'
p '~~ test 3 ~~'
p test3 = maximum_depth(root) == 4
p '~~ test 4 ~~'
p test4 = maximum_depth(root2) == 2

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p1_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts
# ____________________________________________________________________
# Problem 2: Maximum Path Sum

p ' ---------- Problem 2: Maximum Path Sum ---------- '
puts

p '~~ test 1 ~~'
p "max path = #{bst_max_path}"
p test1 = max_path_sum(bst) == bst_max_path

p '~~ test 2 ~~'
p "max path = #{bst2_max_path}"
p test2 = max_path_sum(bst2) == bst2_max_path

p '~~ test 3 ~~'
p "max path = #{bt_max_path}"
p test3 = max_path_sum(bt) == bst2_max_path


tests = [test1, test2, test3]
test_count = tests.count
tests_passed = tests.count(true)

p2_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 3: Array is Possible Pre-order?

p ' ---------- Problem 3: Possible Pre-Order? ---------- '
puts

p '~~ test 1 ~~'
# p test1 =

p '~~ test 2 ~~'
# p test2 =

p '~~ test 3 ~~'
# p test3 =

p '~~ test 4 ~~'
# p test4 =

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p3_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 4: Full or Nah?

p ' ---------- Problem 4: Full Tree? ---------- '
puts

p '~~ test 1 ~~'
# p test1 =

p '~~ test 2 ~~'
# p test2 =

p '~~ test 3 ~~'
# p test3 =

p '~~ test 4 ~~'
# p test4 =

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p4_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 5: Bottom View Binary Tree

p ' ---------- Problem 5: Bottom View ---------- '
puts

p '~~ test 1 ~~'
# p test1 =

p '~~ test 2 ~~'
# p test2 =

p '~~ test 3 ~~'
# p test3 =

p '~~ test 4 ~~'
# p test4 =

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p5_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 6: Print Nodes in Top View of Binary Tree

p ' ---------- Problem 6: Top View Print ---------- '
puts

p '~~ test 1 ~~'
# p test1 =

p '~~ test 2 ~~'
# p test2 =

p '~~ test 3 ~~'
# p test3 =

p '~~ test 4 ~~'
# p test4 =

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p6_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 7: Remove paths greater than length k

p ' ---------- Problem 7: Remove paths of length > K ---------- '
puts

p '~~ test 1 ~~'
# p test1 =

p '~~ test 2 ~~'
# p test2 =

p '~~ test 3 ~~'
# p test3 =

p '~~ test 4 ~~'
# p test4 =

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p2_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts

#____________________________________________________________________
# Problem 8: Lowest Common Ancestor



p ' ---------- Problem 8: LCA ---------- '
puts
node1 = bst.find(1.5)
node2 = bst.find(4)
target = bst.find(3)

p '~~ test 1 ~~'
p test1 = lca(bst, node1, node2) == target


node1 = bst.find(1.5)
node2 = bst.find(10)
target = bst.find(5)

p '~~ test 2 ~~'
p test2 = lca(bst, node1, node2) == target


node1 = bst.find(1.5)
node2 = bst.find(2)
target = bst.find(2)

p '~~ test 3 ~~'
p test3 = lca(bst, node1, node2) == target


node1 = bst.find(1.5)
node2 = bst.find(1.5)
target = bst.find(1.5)

p '~~ test 4 ~~'
p test4 = lca(bst, node1, node2) == target

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p8_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts
# ____________________________________________________________________
# Problem 9: Subtree of another BST?

p ' ---------- Problem 9: Possible Subtree? ---------- '
puts

p '~~ test 1 ~~'
# p test1 =

p '~~ test 2 ~~'
# p test2 =

p '~~ test 3 ~~'
# p test3 =

p '~~ test 4 ~~'
# p test4 =

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p9_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 10: Reverse Alternate Levels of a Perfect BST

p ' ---------- Problem 10: Possible Subtree? ---------- '
puts

p '~~ test 1 ~~'
# p test1 =

p '~~ test 2 ~~'
# p test2 =

p '~~ test 3 ~~'
# p test3 =

p '~~ test 4 ~~'
# p test4 =

tests = [test1, test2, test3, test4]
test_count = tests.count
tests_passed = tests.count(true)

p10_total = tests_passed

puts
p "passed #{tests_passed} out of #{test_count} tests"
puts
