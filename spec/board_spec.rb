require 'board'
require 'rspec'

describe 'Board' do
  before :each do
    reader, writer = IO.pipe
    writer.puts '3'
    writer.puts '--p'
    writer.puts '-m-'
    writer.puts '---'
    @board = Board.new reader
  end

  describe '.grid_size' do
    it 'knows the size of its grid' do
      expect(@board.grid_size).to eql 3
    end
  end

  describe '.grid' do
    it 'knows the board matrix' do
      expect(@board.grid).to eql ['--p', '-m-', '---']
    end
  end

  describe '.mario' do
    it 'has a bot' do
      expect(@board.mario.mark).to eql 'm'
    end
  end

  describe '.princess' do
    it 'has a target' do
      expect(@board.princess.mark).to eql 'p'
    end
  end
end

describe 'Board.displayPathtoPrincess' do
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
    # princess_location_options = [[0,0],[0,n-1],[n-1,n-1],[n-1,0]]
    # princess_location = princess_location_options.sample
    grid[n-1][n-1] = "p"
    before do
      reader, writer = IO.pipe
      writer.puts grid
      @board = Board.new reader
      @mario = @board.mario
      @princess = @board.princess
    end
    it "will move the 'm' character to the 'p' character for a grid size of #{n}x#{n}" do
      expect(@mario.location).to eql @princess.location
    end
    n += 2
  end
end
