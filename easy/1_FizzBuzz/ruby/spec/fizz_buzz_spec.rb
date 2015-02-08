require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('3 5 10') }

  describe '#initialize' do
    it 'should generate X, Y and N values' do
      expect(parse_input.x).to eq(3)
      expect(parse_input.y).to eq(5)
      expect(parse_input.n).to eq(10)
    end
  end
end

RSpec.describe FizzBuzz do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      FizzBuzz.new('../test_input.txt')
      expect($stdout.string).to match('1 2 F 4 B F 7 8 F B')
      expect($stdout.string).to match('1 F 3 F 5 F B F 9 F 11 F 13 FB 15')
    end
  end
end
