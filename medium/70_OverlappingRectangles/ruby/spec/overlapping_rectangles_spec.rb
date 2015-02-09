require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('12') }

end

RSpec.describe OverlappingRectangles do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      OverlappingRectangles.new('../test_input.txt')
      expect($stdout.string).to match('False')
      expect($stdout.string).to match('True')
    end
  end
end
