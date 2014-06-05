require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('Feb 2004-Dec 2009; Sep 2004-Jul 2008')}
end

RSpec.describe WorkingExperience do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      WorkingExperience.new('../test_input.txt')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('4')
      expect($stdout.string).to match('1')
      expect($stdout.string).to match('6')
      expect($stdout.string).to match('0')
    end
  end
end