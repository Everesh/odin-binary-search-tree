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

  def delete(val, node = root)
    return nil if node.nil?

    if val < node.val
      node.left = delete(val, node.left)
    elsif val > node.val
      node.right = delete(val, node.right)
    else
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      end

      nearest_leaf = node.right
      nearest_leaf = nearest_leaf.left until nearest_leaf.left.nil?
      node.val = nearest_leaf.val
      node.right = delete(node.val, node.right)
    end
    node
  end

  def find(val)
    node = root
    until node.nil?
      return node if node.val == val

      node = val > node.val ? node.right : node.left
    end
    nil
  end

  def level_order
    queue = [root]
    vals = []
    until queue.empty?
      node = queue.shift
      block_given? ? yield(node) : vals << node.val
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    vals unless block_given?
  end

  def preorder(node = root, vals = [], &block)
    return vals if node.nil?

    block_given? ? yield(node) : vals << node.val
    preorder(node.left, vals, &block)
    preorder(node.right, vals, &block)
    vals unless block_given?
  end

  def inorder(node = root, vals = [], &block)
    return vals if node.nil?

    inorder(node.left, vals, &block)
    block_given? ? yield(node) : vals << node.val
    inorder(node.right, vals, &block)
    vals unless block_given?
  end

  def postorder(node = root, vals = [], &block)
    return vals if node.nil?

    postorder(node.left, vals, &block)
    postorder(node.right, vals, &block)
    block_given? ? yield(node) : vals << node.val
    vals unless block_given?
  end

  def height(node = root)
    return -1 if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    [left_height, right_height].max + 1
  end

  def depth(node = root)
    runner = root
    depth = 0
    until runner == node
      depth += 1
      runner = runner.val > node.val ? runner.left : runner.right
    end
    depth
  end

  private

  attr_writer :root

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    Node.new(arr[mid], build_tree(arr[0...mid]), build_tree(arr[mid + 1..]))
  end
end
