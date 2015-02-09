require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('12') }

end

RSpec.describe DecodeNumbers do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      DecodeNumbers.new('../test_input.txt')
      expect($stdout.string).to match('2')
      expect($stdout.string).to match('3')
    end
  end
end
