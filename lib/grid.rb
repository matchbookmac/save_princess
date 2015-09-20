Array.class_eval do
  def self.grid size
    grid = Array.new size
    (0...size).each do |i|
      grid[i] = ""
      size.times do
        grid[i] = grid[i] + "-"
      end
    end
    # mario location
    grid[size/2][size/2] = "m"
    # princess location
    princess_location_options = [[0,0],[0,size-1],[size-1,size-1],[size-1,0]]
    p_loc = princess_location_options.sample
    grid[p_loc[0]][p_loc[1]] = "p"
    grid
  end
end
