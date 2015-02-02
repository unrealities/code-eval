require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

end

RSpec.describe ReadMore do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      ReadMore.new('../test_input.txt')
      expect($stdout.string).to match('Tom exhibited.')
      expect($stdout.string).to match('Amy Lawrence was proud and glad, and... <Read More>')
      expect($stdout.string).to match('Tom was tugging at a button-hole and looking sheepish.')
      expect($stdout.string).to match('Two thousand verses is a great many -... <Read More>')
      expect($stdout.string).to match('Tom\'s mouth watered for the apple, but... <Read More>')
    end
  end
end
