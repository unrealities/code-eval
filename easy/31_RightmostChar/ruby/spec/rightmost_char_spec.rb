require_relative '../rightmost_char'

describe "rightmost_char" do
  describe ParseInput do
    let(:parse_input){ParseInput.new('Hello World,r')}

    describe "#sentence" do
      it "returns 'Hello World'" do
        expect(parse_input.sentence).to eq 'Hello World'
      end
    end

    describe "#search_char" do
      it "returns 'r'" do
        expect(parse_input.search_char).to eq 'r'
      end
    end
  end

  describe Search do
    describe "#rightmost_char_index" do
      it "returns '8' given 'Hello World,r'" do
        expect(Search.new('Hello World', 'r').rightmost_char_index).to eq 8
      end
    end
  end

  describe RightmostChar do
    before do
      $stdout = StringIO.new
    end

    after(:all) do
      $stdout = STDOUT
    end

    it "should return correct test outputs given test input" do
      RightmostChar.new('../test_input.txt')
      expect($stdout.string).to match('8')
      expect($stdout.string).to match('10')
    end
  end
end