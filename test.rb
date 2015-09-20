#!/bin/ruby
require './lib/grid'

n = 3
until (n == 21) do
  grid = Array.grid n
  puts grid
  puts grid[0].include?('p') || grid[n-1].include?('p')
  n += 2
end
