require_relative 'spec_helper'

RSpec.describe JugglingWithZeros do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      JugglingWithZeros.new('../test_input.txt')
      expect($stdout.string).to match('9')
      expect($stdout.string).to match('1')
      expect($stdout.string).to match('9208')
      expect($stdout.string).to match('3')
    end
  end
end
