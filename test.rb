# class Thing
#   def initialize
#     @n = 3
#   end
#
#   def thing
#     until (@n == 9)
#       grid = Array.new @n
#       (0...@n).each do |i|
#         grid[i] = ""
#         @n.times do
#           grid[i] = grid[i] + "-"
#         end
#       end
#       grid[@n/2][@n/2] = "m"
#       grid[@n-1][@n-1] = "p"
#       puts grid
#       @n += 2
#     end
#   end
# end
#
#
# thing = Thing.new
# thing.thing
n = 3
until (n == 101)
  grid = Array.new n
  (0...n).each do |i|
    grid[i] = ""
    n.times do
      grid[i] = grid[i] + "-"
    end
  end
  # mario location
  grid[n/2][n/2] = "m"
  # princess location
  princess_location_options = [[0,0],[0,n-1],[n-1,n-1],[n-1,0]]
  p_loc = princess_location_options.sample
  grid[p_loc[0]][p_loc[1]] = "p"
  puts grid
  # before do
  #   reader, writer = IO.pipe
  #   writer.puts grid
  #   @board = Board.new reader
  #   @mario = @board.mario
  #   @princess = @board.princess
  # end
  # it "will move the 'm' character to the 'p' character for a grid size of #{n}x#{n}" do
  #   expect(@mario.location).to eql @princess.location
  # end
  n += 2
end
