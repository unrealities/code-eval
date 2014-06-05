require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('Rkbs,5453; Wdqiz,1245; Rwds,3890; Ujma,5589; Tbzmo,1303;')}

  describe "#to_i_a" do
    it "should return an array of integers" do
      expect(parse_input.to_i_a).to eq [5453, 1245, 3890, 5589, 1303]
    end
  end
end

RSpec.describe CalcPathDistance do
  let(:calc_path_distance) { CalcPathDistance.new([5453, 1245, 3890, 5589, 1303])}

  describe "#calc_path_distance" do
    it "should return a sorted array of path distances" do
      expect(calc_path_distance.calc_path_distance).to eq '1245,58,2587,1563,136'
    end
  end
end

RSpec.describe RoadTrip do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      RoadTrip.new('../test_input.txt')
      expect($stdout.string).to match('1245,58,2587,1563,136')
      expect($stdout.string).to match('70,2489,67,1135,197')
      expect($stdout.string).to match('1240,2344,1779,357,279')
      expect($stdout.string).to match('2683,2553')
    end
  end
end