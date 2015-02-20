require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('1,2,3,4;4,5,6')}

  describe "#array_of_arrays" do
    it "should return an array of arrays" do
      expect(parse_input.array_of_arrays).to eq [[1, 2, 3, 4], [4, 5, 6]]
    end
  end
end

RSpec.describe CompareArrays do
  let(:compare_arrays) { CompareArrays.new([[1, 2, 3, 4], [4, 5, 6]])}

  describe "#intersection" do
    it "should return the array intersection" do
      expect(compare_arrays.intersection).to eq [4]
    end
  end

end

RSpec.describe SetIntersection do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      SetIntersection.new('../test_input.txt')
      expect($stdout.string).to match('4')
      expect($stdout.string).to match('')
      expect($stdout.string).to match('8,9')
    end
  end
end