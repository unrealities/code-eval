require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('22 2 2 9 11') }

  describe '#initialize' do
    it 'returns the length of the wire' do
      expect(parse_input.length_of_wire).to eq(22)
    end
    it 'returns the distance between bats' do
      expect(parse_input.distance_between_bats).to eq(2)
    end
    it 'returns the initial bat positions' do
      expect(parse_input.init_bats).to eq [2, 9, 11]
    end
  end
end

RSpec.describe BatsChallenge do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    xit 'should return correct test outputs given test input' do
      BatsChallenge.new('../test_input.txt')
      expect($stdout.string).to match('3')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('0')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('8')
    end
  end
end
