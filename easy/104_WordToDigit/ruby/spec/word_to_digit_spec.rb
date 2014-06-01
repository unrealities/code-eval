require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('zero;two;five;seven;eight;four')}

  describe "#to_a" do
    it "shoud split and return an array" do
      expect(parse_input.to_a).to eq ["zero", "two", "five", "seven", "eight", "four"]
    end
  end
end

Rspec.describe Convert do
  let(:convert) { Convert.new(["zero", "two", "five", "seven", "eight", "four"])}

  describe "@de_humanize" do
    it "should return an array of digits" do
      expect(convert.de_humanize).to eq [0, 2, 5, 7, 8, 4]
    end
  end
end

RSpec.describe WordToDigit do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      WordToDigit.new('../test_input.txt')
      expect($stdout.string).to match('025784')
      expect($stdout.string).to match('37892')
    end
  end
end