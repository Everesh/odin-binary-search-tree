require_relative 'node'
require_relative 'printer'

class BinarySeachTree
  include Printer

  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr.sort.uniq)
  end

  private

  attr_writer :root

  def build_tree(arr)
    return nil if arr.empty?

    mid = arr.length / 2
    Node.new(arr[mid], build_tree(arr[0...mid]), build_tree(arr[mid + 1..]))
  end
end
