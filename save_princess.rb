#!/bin/ruby
require './lib/board'
require './lib/grid'

n = 3
until (n == 21) do
  reader, writer = IO.pipe
  grid = Array.grid n
  writer.puts n
  writer.puts grid
  board = Board.new reader
  puts grid
  puts board.display_path_to_princess
  n += 2
end
