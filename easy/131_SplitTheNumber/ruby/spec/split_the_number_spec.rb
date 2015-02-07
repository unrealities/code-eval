require_relative 'spec_helper'

RSpec.describe SplitTheNumber do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      SplitTheNumber.new('../test_input.txt')
      expect($stdout.string).to match('-413289827')
      expect($stdout.string).to match('83')
      expect($stdout.string).to match('2346')
      expect($stdout.string).to match('44')
      expect($stdout.string).to match('611')
    end
  end
end
