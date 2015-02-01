require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

end

RSpec.describe WithoutRepetitions do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      WithoutRepetitions.new('../test_input.txt')
      expect($stdout.string).to match('But as he spake he drew the god sword from its scabard, and smote a heathen knight, Justin of the Iron Valey.')
      expect($stdout.string).to match('No mater whom you chose, she declared, I wil abide by your decision.')
      expect($stdout.string).to match('Wwhat is your wil?')
      expect($stdout.string).to match('At his magic spech the ground opened and he began the path of descent.')
      expect($stdout.string).to match('I should fly away and you would never se me again.')
    end
  end
end
