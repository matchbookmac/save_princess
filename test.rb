class Thing
  def initialize
    @n = 3
  end

  def thing
    until (@n == 9)
      grid = Array.new @n
      (0...@n).each do |i|
        grid[i] = ""
        @n.times do
          grid[i] = grid[i] + "-"
        end
      end
      grid[@n/2][@n/2] = "m"
      grid[@n-1][@n-1] = "p"
      puts grid
      @n += 2
    end
  end
end


thing = Thing.new
thing.thing
