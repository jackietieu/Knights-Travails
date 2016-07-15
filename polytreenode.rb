class PolyTreeNode
  def initialize
    @parent = nil
    @children = []
    @value = true
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent = node
    node.children << self unless parent.nil?
  end
end

# class Array
#   def deep_dup
#     self.map { |el| el.is_array?(Array) ? el.deep_dup : el }
#   end
# end
