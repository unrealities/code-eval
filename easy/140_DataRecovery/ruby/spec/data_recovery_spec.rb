require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

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
