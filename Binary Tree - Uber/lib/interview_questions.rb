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
  tree_map = { }
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

def top_view_print(bt)

end

# ____________________________________________________________________
# Problem 7: Remove paths greater than length k
# ____________________________________________________________________

def limit_path_length(bt)

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

bst_pre_order = [5, 3, 1, 0, 2, 1.5, 4, 7, 9, 10]
bst_post_order = [0, 1.5, 2, 1, 4, 3, 10, 9, 7, 5]
bst_max_path = [1.5, 2, 1, 3, 5, 7, 9, 10].reduce(:+)
bst_bottom_view = [0, 1.5, 2, 4, 7, 9, 10]


bst2 = BinarySearchTree.new
[5, 3, 7, 4, -1].each do |el|
  bst2.insert(el)
end

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

bst2_pre_order = [5, 3, -1, 4, 7]
bst2_post_order = [-1, 4, 3, 7, 5]
bst2_max_path = [4, 3, 5, 7].reduce(:+)
bst2_bottom_view = [-1, 3, 4, 7]


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
#         /   \     \       #
#      (20)   (1)   (-25)    #
#                  /  \     #
#                (3)  (4)   #
#############################

bt_max_path = [20, 2, 10, 10].reduce(:+)
bt_bottom_view = [20, 2, 1, 3, 25, 4]

# ____________________________________________________________________
# Problem 0: Traversals

result1 = bst.pre_order_traversal
result2 = bst2.pre_order_traversal
result3 = bst.post_order_traversal
result4 = bst2.post_order_traversal

expect1 = bst_pre_order
expect2 = bst2_pre_order
expect3 = bst_post_order
expect4 = bst2_post_order

p ' ---------- Problem 0: Traversals ---------- '
puts
p 'Pre-Order:'
p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = expect1 == result1
p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = expect2 == result2
puts
p 'Post-Order:'
p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = expect3 == result3
p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
p test4 = expect4 == result4

p0_tests = [test1, test2, test3, test4]
test_count = p0_tests.count
tests_passed = p0_tests.count(true)

p0_total = tests_passed

puts
p "passed #{p0_total} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 1: Minimum Depth

result1 = minimum_depth(root)
result2 = minimum_depth(root2)
result3 = maximum_depth(root)
result4 = maximum_depth(root2)

expect1 =  2
expect2 =  1
expect3 =  4
expect4 =  2


p ' ---------- Problem 1: Depth ---------- '
puts
p 'Minimum Depth:'
p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = expect1 == result1
p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = expect2 == result2
puts
p 'Maximum Depth:'
p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = expect3 == result3
p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
p test4 = expect4 == result4

p1_tests = [test1, test2, test3, test4]
test_count = p1_tests.count
tests_passed = p1_tests.count(true)

p1_total = tests_passed

puts
p "passed #{p1_total} out of #{test_count} tests"
puts
# ____________________________________________________________________
# Problem 2: Maximum Path Sum

p ' ---------- Problem 2: Maximum Path Sum ---------- '
puts

result1 = max_path_sum(bst)
result2 = max_path_sum(bst2)
result3 = max_path_sum(bt)

expect1 = bst_max_path
expect2 = bst2_max_path
expect3 = bst2_max_path

p '~~ test 1 ~~'
p "max path = #{bst_max_path}"
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = expect1 == result1

p '~~ test 2 ~~'
p "max path = #{bst2_max_path}"
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = expect2 == result2

p '~~ test 3 ~~'
p "max path = #{bt_max_path}"
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = expect3 == result3


p2_tests = [test1, test2, test3]
test_count = p2_tests.count
tests_passed = p2_tests.count(true)

p2_total = tests_passed

puts
p "passed #{p2_total} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 3: Array is Possible Pre-order?

p ' ---------- Problem 3: Possible Pre-Order? ---------- '
puts

result1 = possible_pre_order?(bst_pre_order)
result2 = possible_pre_order?(bst2_pre_order)
result3 = possible_pre_order?([2, 4, 1])
result4 = possible_pre_order?([40, 30, 35, 20, 80, 100])

expect1 = true
expect2 = true
expect3 = false
expect4 = false



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = result1 == expect1

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = result2 == expect2

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = result3 == expect3

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
p test4 = result4 == expect4

p3_tests = [test1, test2, test3, test4]
test_count = p3_tests.count
tests_passed = p3_tests.count(true)

p3_total = tests_passed

puts
p "passed #{p3_total} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 4: Full or Nah?

p ' ---------- Problem 4: Full Tree? ---------- '
puts
result1 = full_tree?(bst.root)
result2 = full_tree?(bst2.root)
result3 = full_tree?(bt.root)

expect1 = false
expect2 = true
expect3 = false



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = result1 == expect1

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = result2 == expect2

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = result3 == expect3


p4_tests = [test1, test2, test3]
test_count = p4_tests.count
tests_passed = p4_tests.count(true)

p4_total = tests_passed

puts
p "passed #{p4_total} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 5: Bottom View Binary Tree

p ' ---------- Problem 5: Bottom View ---------- '
puts

result1 = bottom_view(bst.root)
result2 = bottom_view(bst2.root)
result3 = bottom_view(bt.root)

expect1 = bst_bottom_view
expect2 = bst2_bottom_view
expect3 = bt_bottom_view



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = result1 == expect1

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = result2 == expect2

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = result3 == expect3

p5_tests = [test1, test2, test3]
test_count = p5_tests.count
tests_passed = p5_tests.count(true)

p5_total = tests_passed

puts
p "passed #{p5_total} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 6: Print Nodes in Top View of Binary Tree

p ' ---------- Problem 6: Top View Print ---------- '
puts

result1 = false
result2 = false
result3 = false
result4 = false

expect1 = true
expect2 = true
expect3 = true
expect4 = true



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = result1 == expect1

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = result2 == expect2

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = result3 == expect3

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
p test4 = result4 == expect4

p6_tests = [test1, test2, test3, test4]
test_count = p6_tests.count
tests_passed = p6_tests.count(true)

p6_total = tests_passed

puts
p "passed #{p6_total} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 7: Remove paths greater than length k

p ' ---------- Problem 7: Remove paths of length > K ---------- '
puts

result1 = false
result2 = false
result3 = false
result4 = false

expect1 = true
expect2 = true
expect3 = true
expect4 = true



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = result1 == expect1

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = result2 == expect2

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = result3 == expect3

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
p test4 = result4 == expect4

p7_tests = [test1, test2, test3, test4]
test_count = p7_tests.count
tests_passed = p7_tests.count(true)

p7_total = tests_passed

puts
p "passed #{p7_total} out of #{test_count} tests"
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

p8_tests = [test1, test2, test3, test4]
test_count = p8_tests.count
tests_passed = p8_tests.count(true)

p8_total = tests_passed

puts
p "passed #{p8_total} out of #{test_count} tests"
puts
# ____________________________________________________________________
# Problem 9: Subtree of another BST?

p ' ---------- Problem 9: Possible Subtree? ---------- '
puts

result1 = false
result2 = false
result3 = false
result4 = false

expect1 = true
expect2 = true
expect3 = true
expect4 = true



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = result1 == expect1

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = result2 == expect2

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = result3 == expect3

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
p test4 = result4 == expect4

p9_tests = [test1, test2, test3, test4]
test_count = p9_tests.count
tests_passed = p9_tests.count(true)

p9_total = tests_passed

puts
p "passed #{p9_total} out of #{test_count} tests"
puts

# ____________________________________________________________________
# Problem 10: Reverse Alternate Levels of a Perfect BST

p ' ---------- Problem 10: Possible Subtree? ---------- '
puts

result1 = false
result2 = false
result3 = false
result4 = false

expect1 = true
expect2 = true
expect3 = true
expect4 = true



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
p test1 = result1 == expect1

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
p test2 = result2 == expect2

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
p test3 = result3 == expect3

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
p test4 = result4 == expect4

p10_tests = [test1, test2, test3, test4]
test_count = p10_tests.count
tests_passed = p10_tests.count(true)

p10_total = tests_passed

puts
p "passed #{p10_total} out of #{test_count} tests"
puts

puts
puts

total_passes = [p0_total, p1_total, p2_total, p3_total, p4_total,
                p5_total, p6_total, p7_total, p8_total, p9_total,
                p10_total].reduce(:+)
total_tests = [p0_tests, p1_tests, p2_tests, p3_tests, p4_tests,
               p5_tests, p6_tests, p7_tests, p8_tests, p9_tests,
               p10_tests].flatten.count
p '____________________________________________________________________'
p 'total passes:'
p "#{total_passes} out of #{total_tests}"
puts
p "#{total_tests - total_passes} failures"
p '____________________________________________________________________'
