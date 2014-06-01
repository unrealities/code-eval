require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('92,19,19,76,19,21,19,85,19,19,19,94,19,19,22,67,83,19,19,54,59,1,19,19')}
end

RSpec.describe TheMajorElement do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      TheMajorElement.new('../test_input.txt')
      expect($stdout.string).to match('19')
      expect($stdout.string).to match('92')
      expect($stdout.string).to match('None')
    end
  end
end