require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('86,2,3')}
end

RSpec.describe RacingChars do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      RacingChars.new('../test_input.txt')
      expect($stdout.string).to match('#########|##')
      expect($stdout.string).to match('########/_##')
      expect($stdout.string).to match('#######/####')
      expect($stdout.string).to match('######_#\###')
      expect($stdout.string).to match('#######_|###')
      expect($stdout.string).to match('#######/####')
      expect($stdout.string).to match('######/#_###')
      expect($stdout.string).to match('######|_####')
      expect($stdout.string).to match('#######\####')
      expect($stdout.string).to match('#######|####')
    end
  end
end