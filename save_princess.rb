#!/bin/ruby
require './lib/board'
require './lib/grid'

number = ARGV.shift
times = number.to_i || 21
if times.odd?
  n = 3
  until (n == times) do
    reader, writer = IO.pipe
    grid = Array.grid n
    writer.puts n
    writer.puts grid
    board = Board.new reader
    puts grid
    puts board.display_path_to_princess
    n += 2
  end
else
  puts "Please enter an odd number"
end
