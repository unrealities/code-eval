require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('3 3 9 1 6 5 8 1 5 3')}

  describe "#score_array" do
    it "should return an array of game scores" do
      expect(parse_input.score_array).to eq [3, 3, 9, 1, 6, 5, 8, 1, 5, 3]
    end
  end
end

RSpec.describe CalcArray do
  let(:calc_array) { CalcArray.new([3, 3, 9, 1, 6, 5, 8, 1, 5, 3])}

  describe "#count_array_for_digits_1_to_9" do
    it "should return a correct array count" do
      expect(calc_array.count_array_for_digits_1_to_9).to eq [2, 0, 3, 0, 2, 1, 0, 1, 1]
    end
  end

  describe "#winner" do
    it "should return a winner of 5" do
      expect(calc_array.winner).to eq 5
    end
  end

end

RSpec.describe LowestUniqueNumber do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      LowestUniqueNumber.new('../test_input.txt')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('0')
    end
  end
end