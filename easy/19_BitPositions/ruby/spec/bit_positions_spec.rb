require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('86,2,3')}

  describe "#to_binary" do
    it "should return a binary value for the first input" do
      expect(parse_input.to_binary).to eq '1010110'
    end
  end

  describe "#indices" do
    it "should return an array of digits to compare" do
      expect(parse_input.binary_indices).to eq [1, 2]
    end
  end
end

RSpec.describe BitPositions do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      BitPositions.new('../test_input.txt')
      expect($stdout.string).to match('true')
      expect($stdout.string).to match('false')
    end
  end
end