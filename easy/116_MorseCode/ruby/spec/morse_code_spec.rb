require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('.- ...- ..--- .-- .... .. . -.-. -..-  ....- .....')}
end

RSpec.describe MorseCode do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      MorseCode.new('../test_input.txt')
      expect($stdout.string).to match('AV2WHIECX 45')
      expect($stdout.string).to match('BH3')
    end
  end
end