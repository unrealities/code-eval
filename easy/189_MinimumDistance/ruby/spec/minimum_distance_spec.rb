require_relative 'spec_helper'

RSpec.describe MinimumDistance do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      FizzBuzz.new('../test_input.txt')
      expect($stdout.string).to match('6')
      expect($stdout.string).to match('20')
    end
  end
end
