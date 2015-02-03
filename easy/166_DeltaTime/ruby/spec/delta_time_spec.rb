require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

end

RSpec.describe DeltaTime do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      DeltaTime.new('../test_input.txt')
      expect($stdout.string).to match('01:14:46')
      expect($stdout.string).to match('09:06:33')
      expect($stdout.string).to match('00:30:22')
      expect($stdout.string).to match('20:45:08')
      expect($stdout.string).to match('00:15:11')
    end
  end
end
