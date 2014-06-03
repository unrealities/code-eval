require_relative 'spec_helper'

RSpec.describe FibonacciSeries do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      FibonacciSeries.new('../test_input.txt')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('144')
    end
  end
end