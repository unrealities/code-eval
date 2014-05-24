require_relative '../find_a_writer'

describe "find_a_writer" do
  describe ParseInput do
    let(:parse_input){ParseInput.new('osSE5Gu0Vi8WRq93UvkYZCjaOKeNJfTyH6tzDQbxFm4M1ndXIPh27wBA rLclpg| 3 35 27 62 51 27 46 57 26 10 46 63 57 45 15 43 53')}

    describe "#encoded_string" do
      it "returns 'osSE5Gu0Vi8WRq93UvkYZCjaOKeNJfTyH6tzDQbxFm4M1ndXIPh27wBA rLclpg'" do
        expect(parse_input.encoded_string).to eq 'osSE5Gu0Vi8WRq93UvkYZCjaOKeNJfTyH6tzDQbxFm4M1ndXIPh27wBA rLclpg'
      end
    end

    describe "#keys_array" do
      it "returns '[3, 35, 27, 62, 51, 27, 46, 57, 26, 10, 46, 63, 57, 45, 15, 43, 53]'" do
        expect(parse_input.keys_array).to eq [3, 35, 27, 62, 51, 27, 46, 57, 26, 10, 46, 63, 57, 45, 15, 43, 53]
      end
    end
  end

  describe Decode do
    describe "#decode_string" do
      it "returns 'abc' given 'a1b2c' and '[1, 3, 5]'" do
        expect(Decode.new('a1b2c',[1, 3, 5]).decoded_string).to eq 'abc'
      end
    end
  end

  describe FindAWriter do
    before do
      $stdout = StringIO.new
    end

    after(:all) do
      $stdout = STDOUT
    end

    it "should return correct test outputs given test input" do
      FindAWriter.new('../test_input.txt')
      expect($stdout.string).to match('Stephen King 1947')
      expect($stdout.string).to match('Kyotaro Nishimura 1930')
    end
  end
end