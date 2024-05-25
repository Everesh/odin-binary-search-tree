require_relative 'node'

class BST
  attr_reader :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  private

  attr_writer :root
end
