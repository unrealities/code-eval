require_relative '../lib/capitalize_words'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('javaScript language')}

  describe "#to_caps" do
    it "should return a capitalized set" do
      expect(parse_input.to_caps).to eq 'JavaScript Language'
    end
  end
end

RSpec.describe CapitalizeWords do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      CapitalizeWords.new('../test_input.txt')
      expect($stdout.string).to match('Hello World')
      expect($stdout.string).to match('JavaScript Language')
      expect($stdout.string).to match('A Letter')
      expect($stdout.string).to match('1st Thing')
    end
  end
end