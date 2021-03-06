require_relative 'spec_helper'

RSpec.describe JsonMenuIDs do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      JsonMenuIDs.new('../test_input.txt')
      expect($stdout.string).to match('46')
      expect($stdout.string).to match('0')
      expect($stdout.string).to match('248')
    end
  end
end
