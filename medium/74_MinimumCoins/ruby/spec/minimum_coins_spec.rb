require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('11') }

end

RSpec.describe MinimumCoins do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      MinimumCoins.new('../test_input.txt')
      expect($stdout.string).to match('3')
      expect($stdout.string).to match('4')
    end
  end
end
