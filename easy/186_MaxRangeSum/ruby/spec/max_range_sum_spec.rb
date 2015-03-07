require_relative 'spec_helper'

RSpec.describe MaxRangeSums do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      MaxRangeSums.new('../test_input.txt')
      expect($stdout.string).to match('16\n0\n17')
    end
  end
end
