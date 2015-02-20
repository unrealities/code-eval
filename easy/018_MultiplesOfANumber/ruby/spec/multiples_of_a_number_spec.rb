require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('13,8')}

  describe "#number" do
    it "should return 13" do
      expect(parse_input.number).to eq 13
    end
  end

  describe "#multiple" do
    it "should return 8" do
      expect(parse_input.multiple).to eq 8
    end
  end
end

RSpec.describe Compare do
  let(:compare) { Compare.new(13, 8)}

  describe "#largest_multiple" do
    it "should return 16" do
      expect(compare.largest_multiple).to eq 16
    end
  end
end

RSpec.describe MultiplesOfANumber do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      MultiplesOfANumber.new('../test_input.txt')
      expect($stdout.string).to match('16')
      expect($stdout.string).to match('32')
    end
  end
end