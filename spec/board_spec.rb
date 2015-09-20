require 'board'
require 'grid'
require 'rspec'

describe 'Board' do
  before :each do
    reader, writer = IO.pipe
    writer.puts '3'
    writer.puts Array.grid 3
    @board = Board.new reader
  end

  describe '.grid_size' do
    it 'knows the size of its grid' do
      expect(@board.grid_size).to eql 3
    end
  end

  describe '.grid' do
    it 'knows the board matrix' do
      expect(@board.grid[0].include?('p') || @board.grid[2].include?('p'))
      expect(@board.grid.length).to eql 3
      expect(@board.grid[0].length).to eql 3
      expect(@board.grid[2].length).to eql 3
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

describe 'Board.display_path_to_princess' do
  n = 3
  until (n == 101) do
    grid = Array.grid n
    it "will move the 'm' character to the 'p' character for a grid size of #{n}x#{n}" do
      reader, writer = IO.pipe
      writer.puts grid
      board = Board.new reader
      mario = board.mario
      princess = board.princess
      expect(mario.location).to eql princess.location
    end
    n += 2
  end
end
