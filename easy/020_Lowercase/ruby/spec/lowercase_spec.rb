require_relative 'spec_helper'

RSpec.describe Lowercase do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      Lowercase.new('../test_input.txt')
      expect($stdout.string).to match('World Hello')
      expect($stdout.string).to match('CodeEval Hello')
    end
  end
end