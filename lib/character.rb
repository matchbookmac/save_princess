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
