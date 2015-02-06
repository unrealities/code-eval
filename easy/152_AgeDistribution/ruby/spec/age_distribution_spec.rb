require_relative 'spec_helper'

RSpec.describe AgeDistribution do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      AgeDistribution.new('../test_input.txt')
      expect($stdout.string).to match('Still in Mama\'s arms')
      expect($stdout.string).to match('College')
    end
  end
end
