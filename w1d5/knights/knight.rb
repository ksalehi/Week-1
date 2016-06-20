require 'byebug'
require_relative 'tree_node'

class KnightPathFinder

  attr_reader :curr_pos, :visited_positions, :move_tree, :valid_moves, :root_pos

  def initialize(root_pos = [0, 0])
    @root_pos = root_pos
    @visited_positions = [root_pos]
    build_move_tree
  end

  def build_move_tree
    @root_node = PolyTreeNode.new(root_pos)
    queue = [@root_node]
    until queue.empty?
      node = queue.shift
      new_move_positions(node.value).each do |child_pos|
        child_node = PolyTreeNode.new(child_pos)
        node.add_child(child_node)
        queue << child_node
      end
    end
  end

  def valid_moves(curr_pos)
    x, y = curr_pos

    possible_moves = []
    [-1, +1].each do |dx|
      [-2, +2].each do |dy|
        move = [(x+dx), (y+dy)]
        possible_moves << move unless move[0] < 0 || move[0] > 7 ||
          move[1] < 0 || move[1] > 7
      end
    end
    [-2, +2].each do |dx|
      [-1, +1].each do |dy|
        move = [(x+dx), (y+dy)]
        possible_moves << move if move[0].between?(0,7) &&
          move[1].between?(0,7)
      end
    end
    possible_moves
  end

  def new_move_positions(curr_pos)
    new_positions = valid_moves(curr_pos) - visited_positions
    visited_positions.concat(new_positions)
    new_positions
  end

  def find_path(end_pos)
    end_node = @root_node.dfs(end_pos)
    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    return [root_pos] if end_node.value == @root_node.value
    trace_path_back(end_node.parent) << end_node.value
  end

end

a = KnightPathFinder.new
p a.find_path([7, 6])
