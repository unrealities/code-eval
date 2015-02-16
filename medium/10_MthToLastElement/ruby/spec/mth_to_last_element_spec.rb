require_relative 'spec_helper'

RSpec.describe MthToLastElement do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      MthToLastElement.new('../test_input.txt')
      expect($stdout.string).to match('a')
      expect($stdout.string).to match('g')
    end
  end
end
