require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

end

RSpec.describe MatrixRotation do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      MatrixRotation.new('../test_input.txt')
      expect($stdout.string).to match('c a d b')
      expect($stdout.string).to match('m i e a n j f b o k g c p l h d')
      expect($stdout.string).to match('g d a h e b i f c')
    end
  end
end
