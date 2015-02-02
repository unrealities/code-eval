require_relative 'spec_helper'

RSpec.describe SquareMatrix do
  describe '#initialize' do
    it 'has a dimension equal to the square root of the length of the initial values' do
      expect(SquareMatrix.new('a b c d').dim).to eq(2)
    end
  end
  
  describe '#to_s' do
    it 'returns a string representation of the matrix' do
      expect(SquareMatrix.new('a b c d').to_s).to eq('a b c d')
    end
  end
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
      # [ a b ] -> [ c a ]
      # [ c d ] -> [ d b ]
      expect($stdout.string).to match('c a d b')
      # [ a b c d ] -> [ m i e a ]
      # [ e f g h ] -> [ n j f b ]
      # [ i j k l ] -> [ o k g c ]
      # [ m n o p ] -> [ p l h d ]
      expect($stdout.string).to match('m i e a n j f b o k g c p l h d')
      # [ a b c ] -> [ g d a ]
      # [ d e f ] -> [ h e b ]
      # [ g h i ] -> [ i f c ]
      expect($stdout.string).to match('g d a h e b i f c')
    end
  end
end
