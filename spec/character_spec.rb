require 'character'
require 'board'
require 'rspec'

describe 'Character' do
  before :each do
    reader, writer = IO.pipe
    writer.puts '3'
    writer.puts '--p'
    writer.puts '-m-'
    writer.puts '---'
    board = Board.new reader
    @character = board.mario
  end

  describe '.location' do
    it 'knows its location on the board' do
      expect(@character.location).to eql [1,1]
    end
  end

  describe '.mark' do
    it 'knows its mark' do
      expect(@character.mark).to eql 'm'
    end
  end
end
