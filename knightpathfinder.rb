require_relative 'polytreenode.rb'

class KnightPathFinder
  attr_reader :root_node

  def initialize(starting_pos = [0, 0])
    @starting_pos = starting_pos
    @visited_positions = [@starting_pos]
    @root_node = PolyTreeNode.new(@starting_pos)

    build_move_tree
  end

  def build_move_tree
    nodes_queue = [@root_node]

    until nodes_queue.empty?
      current_node = nodes_queue.shift
      current_pos = current_node.value

      new_move_positions(current_pos).each do |next_move|
        child_node = PolyTreeNode.new(next_move)
        current_node.add_child(child_node)

        nodes_queue << child_node
      end
    end
  end

  def self.valid_moves(pos)
    x, y = pos
    possible_moves = []

    coordinate_modifiers = [-1, 1].product([-2, 2])

    coordinate_modifiers.each do |mod|
      possible_moves << [x + mod.first, y + mod.last]
      possible_moves << [x + mod.last, y + mod.first]
    end

    possible_moves.select { |pos| pos.first.between?(0,7) && pos.last.between?(0,7) }
  end



  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    valid_moves.reject! do |move|
      @visited_positions.include?(move)
    end

    @visited_positions += valid_moves
    valid_moves
  end

  def find_path(ending_pos)
    return @root_node if @root_node.value == ending_pos

    queue = [@root_node]
    end_node = nil

    until queue.empty?
      current_node = queue.shift
      # current_pos = current_node.value

      current_node.children.each do |child_node|
        if child_node.value == ending_pos
          end_node = child_node
          break
        end
        queue << child_node
      end
    end

    trace_path_back(end_node)
  end

  def trace_path_back(end_node)
    path = []
    current_node = end_node

    until current_node.parent.nil?
      path << current_node.value
      current_node = current_node.parent
    end

    path << @starting_pos

    path.reverse
  end

end


k = KnightPathFinder.new
p k.find_path([7,6])
