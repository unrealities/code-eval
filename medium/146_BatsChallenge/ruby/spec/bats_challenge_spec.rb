require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('12') }

end

RSpec.describe BatsChallenge do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end
  > 3

  > 5

  > 0

  > 5

  > 8
  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      BatsChallenge.new('../test_input.txt')
      expect($stdout.string).to match('3')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('0')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('8')
    end
  end
end
