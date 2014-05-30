require_relative '../mixed_content'

  RSpec.describe ParseInput do
    let(:parse_input) { ParseInput.new('8,33,21,0,16,50,37,0,melon,7,apricot,peach,pineapple,17,21') }

    describe "#to_i" do
      it "should return an array of integers" do
        expect(parse_input.to_i).to eq [8, 33, 21, 0, 16, 50, 37, 0, 7, 17, 21]
      end
    end

    describe "#to_s" do
      it "should return an array of strings" do
        expect(parse_input.to_s).to eq ["melon", "apricot", "peach", "pineapple"]
      end
    end

    describe "#join" do
      it "should join integer and string arrays" do
        expect(parse_input.join).to eq 'melon,apricot,peach,pineapple|8,33,21,0,16,50,37,0,7,17,21'
      end
    end
  end

  RSpec.describe MixedContent do
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