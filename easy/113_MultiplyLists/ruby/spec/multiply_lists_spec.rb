require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('9 0 6 | 15 14 9') }

  describe '#initialize' do
    it 'should return two array of numbers' do
      expect(parse_input.array1).to eq([9, 0, 6])
      expect(parse_input.array2).to eq([15, 14, 9])
    end
  end
end

RSpec.describe MultiplyLists do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      MultiplyLists.new('../test_input.txt')
      expect($stdout.string).to match('135 0 54')
      expect($stdout.string).to match('40')
      expect($stdout.string).to match('13 16 225 14 120 10')
    end
  end
end
