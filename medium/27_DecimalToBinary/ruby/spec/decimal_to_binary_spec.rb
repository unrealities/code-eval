require_relative 'spec_helper'

RSpec.describe DecimalToBinary do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      DecimalToBinary.new('../test_input.txt')
      expect($stdout.string).to match('10')
      expect($stdout.string).to match('1010')
      expect($stdout.string).to match('1000011')
    end
  end
end
