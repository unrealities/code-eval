require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('1,2,3,4,5;2') }
  
  describe '#initialize' do
    it 'returns an array of ints to be reversed' do
      expect(parse_input.array_to_reverse).to eq %w{ 1 2 3 4 5 }
    end
    it 'returns a reversal length' do
      expect(parse_input.reverse_length).to eq(2)
    end
  end

end

RSpec.describe ReverseGroups do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      ReverseGroups.new('../test_input.txt')
      expect($stdout.string).to match('2,1,4,3,5')
      expect($stdout.string).to match('3,2,1,4,5')
    end
  end
end
