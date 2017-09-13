require_relative 'binary_search_tree'
require_relative 'binary_tree'
require_relative 'interview_questions'
require 'colorize'

# ____________________________________________________________________
# # # # # TESTS # # # # #
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

{4=>2, 3=>2, 0=>3, 1=>3, 10=>3, 9=>3, 7=>3, 1.5=>4, 2=>4}

bst_pre_order = [5, 3, 1, 0, 2, 1.5, 4, 7, 9, 10]
bst_post_order = [0, 1.5, 2, 1, 4, 3, 10, 9, 7, 5]
bst_max_path = [1.5, 2, 1, 3, 5, 7, 9, 10].reduce(:+)
bst_bottom_view = [0, 1.5, 2, 4, 7, 9, 10]
bst_top_view = [0, 1, 3, 5, 7, 9, 10]
bst_limit_3 = bst.in_order_traversal
bst_limit_4 = bst_limit_3.reject { |e| e == 4 }
bst_limit_5 = bst_limit_4.reject { |e| e == 0 || e > 6 }


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
bst2_top_view = [-1, 3, 5, 7]
bst2_limit_2 = bst2.in_order_traversal
bst2_limit_3 = bst2_limit_2.reject { |e| e == 7 }


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
#      (20)   (1)   (-25)   #
#                  /  \     #
#                (3)  (4)   #
#############################

bt_max_path = [20, 2, 10, 10].reduce(:+)
bt_bottom_view = [20, 2, 1, 3, -25, 4]
bt_top_view = [20, 2, 10, 10, -25, 4]



def test_result(test)
  test ? "passed".colorize(:green) : "failed".colorize(:light_red)
end




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
test1 = expect1 == result1
puts test_result(test1)
p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = expect2 == result2
puts test_result(test2)
puts
p 'Post-Order:'
p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = expect3 == result3
puts test_result(test3)
p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
test4 = expect4 == result4
puts test_result(test4)

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
test1 = expect1 == result1
puts test_result(test1)
p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = expect2 == result2
puts test_result(test2)
puts
p 'Maximum Depth:'
p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = expect3 == result3
puts test_result(test3)
p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
test4 = expect4 == result4
puts test_result(test4)

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
test1 = expect1 == result1
puts test_result(test1)

p '~~ test 2 ~~'
p "max path = #{bst2_max_path}"
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = expect2 == result2
puts test_result(test2)

p '~~ test 3 ~~'
p "max path = #{bt_max_path}"
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = expect3 == result3
puts test_result(test3)


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
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
test4 = result4 == expect4
puts test_result(test4)

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
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)


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
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)

p5_tests = [test1, test2, test3]
test_count = p5_tests.count
tests_passed = p5_tests.count(true)

p5_total = tests_passed

puts
p "passed #{p5_total} out of #{test_count} tests"
puts






# ____________________________________________________________________
# Problem 6: Top View of Binary Tree

p ' ---------- Problem 6: Top View Print ---------- '
puts

result1 = top_view(bst.root)
result2 = top_view(bst2.root)
result3 = top_view(bt.root)

expect1 = bst_top_view
expect2 = bst2_top_view
expect3 = bt_top_view



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)

p6_tests = [test1, test2, test3]
test_count = p6_tests.count
tests_passed = p6_tests.count(true)

p6_total = tests_passed

puts
p "passed #{p5_total} out of #{test_count} tests"
puts






# ____________________________________________________________________
# Problem 7: Remove paths greater than length k

p ' ---------- Problem 7: Remove paths of length > K ---------- '
puts

bst_clone1 = BinarySearchTree.new
[5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
  bst_clone1.insert(el)
end
bst_clone2 = BinarySearchTree.new
[5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
  bst_clone2.insert(el)
end

bst_clone3 = BinarySearchTree.new
[5, 3, 7, 1, 4, 9, 0, 2, 1.5, 10].each do |el|
  bst_clone3.insert(el)
end

bst2_clone1 = BinarySearchTree.new
[5, 3, 7, 4, -1].each do |el|
  bst2_clone1.insert(el)
end

bst2_clone2 = BinarySearchTree.new
[5, 3, 7, 4, -1].each do |el|
  bst2_clone2.insert(el)
end




tree1 = limit_path_length(bst_clone1, 3)
tree2 = limit_path_length(bst_clone2, 4)
tree3 = limit_path_length(bst_clone3, 5)
tree4 = limit_path_length(bst2_clone1, 2)
tree5 = limit_path_length(bst2_clone2, 3)

result1 = tree1 ? tree1.in_order_traversal : nil
result2 = tree2 ? tree2.in_order_traversal : nil
result3 = tree3 ? tree3.in_order_traversal : nil
result4 = tree4 ? tree4.in_order_traversal : nil
result5 = tree5 ? tree5.in_order_traversal : nil

expect1 = bst_limit_3
expect2 = bst_limit_4
expect3 = bst_limit_5
expect4 = bst2_limit_2
expect5 = bst2_limit_3



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
test4 = result4 == expect4
puts test_result(test4)

p '~~ test 5 ~~'
p "  result: #{result5}"
p "expected: #{expect5}"
test5 = result5 == expect5
puts test_result(test5)


p7_tests = [test1, test2, test3, test4, test5]
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
node1a = bst.find(1.5)
node1b = bst.find(4)
node1 = lca(bst, node1a, node1b)

node2a = bst.find(1.5)
node2b = bst.find(10)
node2 = lca(bst, node2a, node2b)

node3a = bst.find(1.5)
node3b = bst.find(2)
node3 = lca(bst, node3a, node3b)

node4a = bst.find(1.5)
node4b = bst.find(1.5)
node4 = lca(bst, node4a, node4b)

result1 = node1 ? node1.value : nil
result2 = node2 ? node2.value : nil
result3 = node3 ? node3.value : nil
result4 = node4 ? node4.value : nil

expect1 = bst.find(3).value
expect2 = bst.find(5).value
expect3 = bst.find(2).value
expect4 = bst.find(1.5).value



p '~~ test 1 ~~'
p "  result: #{result1}"
p "expected: #{expect1}"
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)


p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
test4 = result4 == expect4
puts test_result(test4)

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
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
test4 = result4 == expect4
puts test_result(test4)

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
test1 = result1 == expect1
puts test_result(test1)

p '~~ test 2 ~~'
p "  result: #{result2}"
p "expected: #{expect2}"
test2 = result2 == expect2
puts test_result(test2)

p '~~ test 3 ~~'
p "  result: #{result3}"
p "expected: #{expect3}"
test3 = result3 == expect3
puts test_result(test3)

p '~~ test 4 ~~'
p "  result: #{result4}"
p "expected: #{expect4}"
test4 = result4 == expect4
puts test_result(test4)

p10_tests = [test1, test2, test3, test4]
test_count = p10_tests.count
tests_passed = p10_tests.count(true)

p10_total = tests_passed

puts
p "passed #{p10_total} out of #{test_count} tests"
puts

puts
puts


p '____________________________________________________________________'

total_passes = [p0_total, p1_total, p2_total, p3_total, p4_total,
                p5_total, p6_total, p7_total, p8_total, p9_total,
                p10_total].reduce(:+)
all_tests = [p0_tests, p1_tests, p2_tests, p3_tests, p4_tests,
               p5_tests, p6_tests, p7_tests, p8_tests, p9_tests,
               p10_tests]
test_names = [ "Traversals", "Minimum Depth", "Maximum Path Sum",
               "Array is Possible Pre-order?", "Full or Nah?",
               "Bottom View Binary Tree",
               "Top View of Binary Tree", "Remove paths greater than length k",
               "Lowest Common Ancestor", "Subtree of another BST?",
               "Reverse Alternate Levels of a Perfect BST"]
total_tests = all_tests.flatten.count

def display_tests(all_tests)
  all_tests.each_with_index do |test_array, problem_number|
    puts
    puts "Problem #{problem_number + 1}: test_names[problem_number]"
    test_array.each_with_index do |t, i|
      puts "test #{i + 1}: " + test_result(t)
    end
  end
end

puts
puts "Test Results by Problem".colorize(:yellow)
puts puts
display_tests(all_tests)

puts puts puts puts

p '____________________________________________________________________'
puts 'total passes:'.colorize(:yellow)
p "#{total_passes} out of #{total_tests}"
puts
puts "#{total_passes} successes".colorize(:green)
puts "#{total_tests - total_passes} failures".colorize(:light_red)
p '____________________________________________________________________'
