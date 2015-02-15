require_relative 'spec_helper'

RSpec.describe Details do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      Details.new('../test_input.txt')
      expect($stdout.string).to match('1\n0\n1\n0\n0\n0\n0\n0\n0\n1\n1\n0\n0\n0\n0\n0\n0\n0\n0\n2\n0\n0\n0\n0\n3\n1\n0\n1\n2\n0\n0\n0\n1\n0\n1\n1\n2\n0\n0\n0\n')
    end
  end
end
