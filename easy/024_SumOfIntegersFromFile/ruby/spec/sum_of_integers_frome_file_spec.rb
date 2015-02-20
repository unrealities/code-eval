require_relative 'spec_helper'

RSpec.describe SumOfIntegersFromFile do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      SumOfIntegersFromFile.new('../test_input.txt')
      expect($stdout.string).to match('17')
    end
  end
end