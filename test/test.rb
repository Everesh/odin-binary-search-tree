require_relative '../lib/binary_search_tree'

tree = BinarySeachTree.new([1,1,1,5,12,7,15,98,48791,15,846,443,58,20])
tree.print

tree.insert(50000)
tree.print
tree.insert(30)
tree.print


tree.delete(50000)
tree.print
tree.delete(20)
tree.print

p tree.find(30)
p tree.find(98)
p tree.find(404)
p tree.find(1)

tree.level_order { |node| puts node.val }
p tree.level_order

tree.preorder { |node| puts node.val }
p tree.preorder

tree.inorder { |node| puts node.val }
p tree.inorder

tree.postorder { |node| puts node.val }
p tree.postorder

p tree.height
p tree.height(tree.find(98))

p tree.depth
p tree.depth(tree.find(98))

tree.print
p tree.balanced?
tree.insert(0)
tree.insert(-1)
tree.print
p tree.balanced?
tree.rebalance
tree.print
p tree.balanced?