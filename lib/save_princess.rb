#!/bin/ruby
class Board
  attr_reader :grid_size, :grid, :mario, :princess

  def initialize
    @grid_size = gets.to_i
    @grid      = build_grid
    @mario     = Character.new('m', self)
    @princess  = Character.new('p', self)
  end

  def displayPathtoPrincess
    print @mario.get_location
    print "\n"
    print @princess.get_location
    print "\n"
    print next_move
    print "\n"
    print @mario.location
    print "\n"
    print @grid_size
    print "\n"
    print @grid
    print "\n"
  end

private
  def build_grid
    grid = Array.new @grid_size
    (0...@grid_size).each do |i|
      grid[i] = gets.strip
    end
    grid
  end

  def next_move
    vertical_diff   = @princess.location[0] - @mario.location[0]
    horizontal_diff = @princess.location[1] - @mario.location[1]
    case
    when (vertical_diff.eql?(0))
      if horizontal_diff > 0
        @mario.location[1] += 1
        "RIGHT\n"
      else
        @mario.location[1] -= 1
        "LEFT\n"
      end
    when (vertical_diff.>(0))
      @mario.location[0] += 1
      "DOWN\n"
    when (vertical_diff.<(0))
      @mario.location[1] -= 1
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
    @location = []
    (0...@board.grid_size).each do |i|
      if @board.grid[i].include?(self.mark)
        location[0] = i
        location[1] = @board.grid[i].index(self.mark)
      end
    end
    @location
  end
end

board = Board.new

board.displayPathtoPrincess
