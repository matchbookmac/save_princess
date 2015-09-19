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
