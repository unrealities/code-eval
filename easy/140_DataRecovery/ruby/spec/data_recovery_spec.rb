require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('programming first The language;3 2 1') }

  describe '#initialize' do
    it 'should populate a words array' do
      expect(parse_input.words).to eq(['programming', 'first', 'The', 'language'])
    end

    it 'should populate a positions array' do
      expect(parse_input.positions).to eq([3, 2, 1, 4])
    end
  end
end

RSpec.describe CalcDataRecovery do
  describe '#order' do
    it 'should order an array given an ordering array' do
      expect(CalcDataRecovery.new(['programming', 'first', 'The', 'language'], [3, 2, 1, 4]).order).to eq ['The', 'first', 'programming', 'language']
    end
  end
  
end

RSpec.describe DataRecovery do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      DataRecovery.new('../test_input.txt')
      expect($stdout.string).to match('However, it was not implemented until 1998 and 2000')
      expect($stdout.string).to match('The first programming language')
      expect($stdout.string).to match('The Manchester Mark 1 ran programs written in Autocode from 1952')
    end
  end
end
