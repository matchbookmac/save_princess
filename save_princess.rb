#!/bin/ruby
require './lib/board'
require './lib/grid'

n = 3
until (n == 101) do
  reader, writer = IO.pipe
  writer.puts n
  writer.puts Array.grid n
  board = Board.new reader
  board.display_path_to_princess
  n += 2
end
