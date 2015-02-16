require_relative 'spec_helper'

RSpec.describe TrailingStrings do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      TrailingStrings.new('../test_input.txt')
      expect($stdout.string).to eq("1\n1\n0\n")
    end
  end
end
