require_relative 'node'
require_relative 'printer'

class BinarySeachTree
  include Printer

  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr.sort.uniq)
  end

  def insert(val, node = root)
    return self.root = Node.new(val) if root.nil?

    if val < node.val
      node.left.nil? ? node.left = Node.new(val) : insert(val, node.left)
    elsif val > node.val
      node.right.nil? ? node.right = Node.new(val) : insert(val, node.right)
    end
  end

  private

  attr_writer :root

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    Node.new(arr[mid], build_tree(arr[0...mid]), build_tree(arr[mid + 1..]))
  end
end
