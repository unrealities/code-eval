require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('thisTHIS') }

  describe '#uppercase_percent' do
    it 'should return the value of uppercase characters' do
      expect(parse_input.uppercase_percent).to eq 50.0
    end
  end
  describe '#lowercase_percent' do
    it 'should return the value of lowercase characters' do
      expect(parse_input.lowercase_percent).to eq 50.0
    end
  end
end

RSpec.describe LettercasePercentageRatio do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      LettercasePercentageRatio.new('../test_input.txt')
      expect($stdout.string).to match('lowercase: 50.00 uppercase: 50.00')
      expect($stdout.string).to match('lowercase: 20.00 uppercase: 80.00')
      expect($stdout.string).to match('lowercase: 0.00 uppercase: 100.00')
      expect($stdout.string).to match('lowercase: 33.33 uppercase: 66.67')
    end
  end
end
