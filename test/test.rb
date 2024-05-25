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
