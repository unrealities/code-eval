require_relative '../lib/calculate_distance'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('(25, 4) (1, -6)')}

  describe "#coord_array" do
    it "should return an array of arrays" do
      expect(parse_input.coord_array).to eq [[25, 4], [1, -6]]
    end
  end
end

RSpec.describe CalculateDistance do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      CalculateDistance.new('../test_input.txt')
      expect($stdout.string).to match('26')
      expect($stdout.string).to match('90')
    end
  end
end