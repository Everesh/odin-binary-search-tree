require_relative 'node'

class BinarySeachTree
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  private

  attr_writer :root

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    Node.new(arr[mid], build_tree(arr[0...mid]), build_tree(arr[mid + 1..]))
  end
end
