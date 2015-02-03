require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

end

RSpec.describe NiceAngles do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      NiceAngles.new('../test_input.txt')
      expect($stdout.string).to match('330.23\'59\"')
      expect($stdout.string).to match('0.00\'03\"')
      expect($stdout.string).to match('14.38\'43\"')
      expect($stdout.string).to match('0.15\'00\"')
      expect($stdout.string).to match('254.10\'11\"')
    end
  end
end
