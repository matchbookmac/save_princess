#!/bin/ruby
class Board
  attr_reader :grid_size, :grid, :mario, :princess

  def initialize
    @grid_size = gets.to_i
    @grid      = build_grid
    @mario     = Character.new('m', self)
    @princess  = Character.new('p', self)
  end

  def build_grid
    grid = Array.new @grid_size
    (0...@grid_size).each do |i|
      grid[i] = gets.strip
    end
    grid
  end

  def displayPathtoPrincess
    print @grid_size
    print "\n"
    print @grid
    print "\n"
  end
end

class Character
  attr_reader :mark, :board

  def initialize(mark, board)
    @mark  = mark
    @board = board
  end
end

board = Board.new

board.displayPathtoPrincess
