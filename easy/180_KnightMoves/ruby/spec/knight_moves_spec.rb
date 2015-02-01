require_relative 'spec_helper'

RSpec.describe CalcKnightMoves do
  let(:calc_knight_moves) { CalcKnightMoves.new('g2') }
  let(:columns) { ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'] }
  let(:rows) { ['1', '2', '3', '4', '5', '6', '7', '8'] }

  describe '#possible_moves' do
    it 'is able to move to 8 possible positions given an initial start in the middle of the board' do
      expect(CalcKnightMoves.new('d4').possible_moves.count).to eq(8)
    end

    it 'is able to move to 2 possible positions given an initial start in a corner of the board' do
      expect(CalcKnightMoves.new('a1').possible_moves.count).to eq(2)
    end
  end
end

RSpec.describe KnightMoves do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      KnightMoves.new('../test_input.txt')
      expect($stdout.string).to match('e1 e3 f4 h4')
      expect($stdout.string).to match('b3 c2')
      expect($stdout.string).to match('b5 b7 c4 c8 e4 e8 f5 f7')
      expect($stdout.string).to match('c4 c6 d3 d7 f3 f7 g4 g6')
      expect($stdout.string).to match('a3 c3 d2')
    end
  end
end
