class Board
  attr_reader :grid_size, :grid, :mario, :princess

  def initialize input = $stdin
    @input     = input
    @grid_size = @input.gets.to_i || nil
    @grid      = build_grid
    @mario     = Character.new 'm', self
    @princess  = Character.new 'p', self
  end

  def display_path_to_princess moves=''
    if @mario.location.eql? @princess.location
      print moves
    else
      moves += next_move
      display_path_to_princess moves
    end
  end

private
  def build_grid
    if @grid_size
      grid = Array.new @grid_size
      (0...@grid_size).each do |i|
        grid[i] = @input.gets.strip
      end
      grid
    else
      0
    end
  end

  def next_move
    # If vertical_diff is > 0, princess is down
    vertical_diff   = @princess.location[0] - @mario.location[0]
    # If horizontal_diff is > 0, princess is right
    horizontal_diff = @princess.location[1] - @mario.location[1]
    case
    when (vertical_diff.eql? 0)
      if horizontal_diff > 0
        @mario.location[1] += 1
        "RIGHT\n"
      else
        @mario.location[1] -= 1
        "LEFT\n"
      end
    when (vertical_diff > 0)
      @mario.location[0] += 1
      "DOWN\n"
    when (vertical_diff < 0)
      @mario.location[0] -= 1
      "UP\n"
    end
  end
end

class Character
  attr_reader :mark, :board, :location

  def initialize(mark, board)
    @mark  = mark
    @board = board
    @location = get_location
  end

  def get_location
    location = []
    (0...@board.grid_size).each do |i|
      if @board.grid[i].include?(self.mark)
        location[0] = i
        location[1] = @board.grid[i].index(self.mark)
      end
    end
    location
  end
end

board = Board.new
board.display_path_to_princess
