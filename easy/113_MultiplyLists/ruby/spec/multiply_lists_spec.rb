require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

end

RSpec.describe MultiplyLists do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      MultiplyLists.new('../test_input.txt')
      expect($stdout.string).to match('135 0 54')
      expect($stdout.string).to match('40')
      expect($stdout.string).to match('13 16 225 14 120 10')
    end
  end
end
