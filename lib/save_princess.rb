#!/bin/ruby
class Board
  attr_reader :grid_size, :grid, :mario, :princess

  def initialize(grid_size, grid)
    @grid_size = grid_size
    @grid      = grid
  end
end


def displayPathtoPrincess(grid_size,grid)
  board = Board.new(grid_size, grid)
end

grid_size = gets.to_i

grid = Array.new(grid_size)

(0...grid_size).each do |i|
  grid[i] = gets.strip
end

displayPathtoPrincess(grid_size,grid)
