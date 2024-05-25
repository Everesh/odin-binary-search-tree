module Printer
  def print(node = @root, prefix = '', is_left = true)
    print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end