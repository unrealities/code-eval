require_relative 'spec_helper'

RSpec.describe UniqueElements do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      UniqueElements.new('../test_input.txt')
      expect($stdout.string).to match('1,2,3,4')
      expect($stdout.string).to match('2,3,4,5')
    end
  end
end