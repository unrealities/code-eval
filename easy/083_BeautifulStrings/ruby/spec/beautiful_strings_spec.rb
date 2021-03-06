require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('ABbCcc') }

  describe '#char_hash' do
    it 'returns a hash of chars with their count' do
      expect(parse_input.char_hash).to eq({'a' => 1, 'b' => 2, 'c' => 3})
    end
  end
end

RSpec.describe BeautifulStrings do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      BeautifulStrings.new('../test_input.txt')
      expect($stdout.string).to match('152')
      expect($stdout.string).to match('754')
      expect($stdout.string).to match('491')
      expect($stdout.string).to match('729')
      expect($stdout.string).to match('646')
    end
  end
end
