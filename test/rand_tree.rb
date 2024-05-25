require_relative '../lib/binary_search_tree'

tree = BinarySeachTree.new(Array.new(15) { rand(1..100) })

tree.print
p tree.balanced?
p tree.preorder
p tree.inorder
p tree.postorder

200.times { tree.insert(rand(1..1000)) }

tree.print
p tree.balanced?
p tree.preorder
p tree.inorder
p tree.postorder

tree.rebalance

tree.print
p tree.balanced?
p tree.preorder
p tree.inorder
p tree.postorder
