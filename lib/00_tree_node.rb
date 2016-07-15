class PolyTreeNode
  def initialize(value)
    @parent = nil
    @children = []
    @value = value
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

  def add_child(child)
    self.children << child
    child.parent = self
  end

  def remove_child(child)
    raise 'not a child' unless self.children.include?(child)
    self.children.delete(child)
    child.parent = nil
  end

  def parent=(node)
    parent.children.delete(self) if parent
    @parent = node
    node.children << self unless parent.nil? || parent.children.include?(self)
  end

  def dfs(target)
    return self if self.value == target
    #return nil if children.nil?

    children.each do |child|
      child_dfs = child.dfs(target)
      return child_dfs unless child_dfs.nil?
    end
    nil
  end

  def bfs(target)

    # children.each do |child|
    #   return child if child.value == target
    # end

    queue = [self]

    until queue.empty?
      current_node = queue.shift

      return current_node if current_node.value == target

      current_node.children.each do |node|
        queue << node
      end
    end

    nil
  end
end
