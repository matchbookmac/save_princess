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
    print @mario.location
    print "\n"
    print @princess.location
    print "\n"
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

  def location
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

board.displayPathtoPrincess
