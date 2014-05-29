require_relative '../mixed_content'

describe "Mixed Content" do
  describe ParseInput do
    let(:parse_input){ParseInput.new('8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21')}
  end

  describe MixedContent do
    before do
      $stdout = StringIO.new
    end

    after(:all) do
      $stdout = STDOUT
    end

    it "should return correct test outputs given test input" do
      MixedContent.new('../test_input.txt')
      expect($stdout.string).to match('melon,apricot,peach,pineapple|8,33,21,0,16,50,37,0,7,17,21')
      expect($stdout.string).to match('24,13,14,43,41')
    end
  end
end