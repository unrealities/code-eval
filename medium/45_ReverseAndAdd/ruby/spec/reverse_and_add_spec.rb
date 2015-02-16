require_relative 'spec_helper'

RSpec.describe ReverseAndAdd do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      ReverseAndAdd.new('../test_input.txt')
      expect($stdout.string).to match('4 9339')
    end
  end
end
