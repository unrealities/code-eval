require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('.- ...- ..--- .-- .... .. . -.-. -..-  ....- .....')}
  describe "#to_a_with_spaces" do
    it "should return an array with spaces as elements too" do
      expect(parse_input.to_a_with_spaces).to eq ['.-', '...-', '..---', '.--', '....', '..', '.', '-.-.', '-..-', ' ', '....-', '.....']
    end
  end
end

RSpec.describe ConvertArray do
  describe "#to_morse_code" do
    it "should return the correct morse code" do
      expect(ConvertArray.new(['.-', '...-', '..---', '.--', '....', '..', '.', '-.-.', '-..-', ' ', '....-', '.....']).to_morss_code).to eq ['A','V','2','W','H','I','E','C','X',' ','4','5']
    end
  end
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