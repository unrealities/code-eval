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
      expect($stdout.string).to match('hello codeeval')
      expect($stdout.string).to match('this is some text')
    end
  end
end
