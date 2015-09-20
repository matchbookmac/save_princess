require 'grid'
require 'rspec'

describe 'Array' do
  describe '#grid' do
    n = 3
    until (n == 101) do
      it "returns a #{n}x#{n} grid with a 'm' in the middle, and a 'p' in one of the corners" do
        grid = Array.grid n
        expect(grid[n/2][n/2]).to eql 'm'
        expect(grid[0].include?('p') || grid[n-1].include?('p'))
        expect(grid.length).to eql n
        expect(grid[0].length).to eql n
        expect(grid[n-1].length).to eql n
      end
      n += 2
    end
  end
end
