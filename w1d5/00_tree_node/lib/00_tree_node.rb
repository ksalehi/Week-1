require 'byebug'
class PolyTreeNode

  attr_accessor :children, :parent
  attr_reader :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
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

  def parent=(parent_obj)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_obj
    parent_obj.children << self unless parent_obj.nil?
  end

  def add_child(child_obj)
    child_obj.parent = self
  end

  def remove_child(child_obj)
    raise "Node is not a child" unless @children.include?(child_obj)
    child_obj.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    @children.each do |child|
      found = child.dfs(target_value)

      return found unless found.nil?
    end

    nil
  end

  def bfs(target_value)
    q = []
    q << self
    until q.empty?
      #byebug
      node = q.shift
      return node if node.value == target_value
      q.concat(node.children)

    end

    nil
  end

end
#
# a = PolyTreeNode.new(1)
# b = PolyTreeNode.new(2)
# c = PolyTreeNode.new(3)
# d = PolyTreeNode.new(4)
#
# b.parent = a
# c.parent = b
# d.parent = b
#
# p a.bfs(4)
# #
#
# # b.parent = a
# b.parent = c
#
# p a
# p b
# p c
