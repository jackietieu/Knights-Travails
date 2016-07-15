class KnightPathFinder
  def initialize(starting_pos = [0, 0])
    @starting_pos = starting_pos
    @visited_positions = [@starting_pos]
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
    x, y = ending_pos
    possible_moves = []

    coordinate_modifiers = [-1, 1].product([-2, 2])

    coordinate_modifiers.each do |mod|
      possible_moves << [x + mod.first, y + mod.last]
      possible_moves << [x + mod.last, y + mod.first]
    end


    possible_moves
  end

end

k = KnightPathFinder.new
k.find_path()
