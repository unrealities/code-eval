require_relative '../swap_elements'

describe "swap_elements" do
  describe "ParseInput" do
    let(:parse_input){ParseInput.new('1 2 3 : 0-1, 1-2')}

    describe "#numbers_array" do
      it "returns ['1','2','3']" do
        expect(parse_input.numbers_array).to eq ["1", "2", "3"]
      end
    end

    describe "#actions_array" do
      it "returns [['0','1'],['1','2']]" do
        expect(parse_input.actions_array).to eq [["0","1"],["1","2"]]
      end
    end
  end

  describe "SwapArrayValues" do
    let(:swap_array_values) {SwapArrayValues.new(["1","2","3"],[["0","1"],["1","2"]])}

    describe "#swap" do
      it "returns ['2','1','3'] when swapping indices 0 and 1" do
        expect(swap_array_values.swap(["1","2","3"], 0, 1)).to eq ["2", "1", "3"]
      end
    end

    describe "#update" do
      it "returns '2 3 1' given '1 2 3', [['0','1'],['1','2']] " do
        expect(swap_array_values.update).to eq "2 3 1"
      end
    end
  end

  describe "SwapElements" do
    before do
      $stdout = StringIO.new
    end

    after(:all) do
      $stdout = STDOUT
    end

    it "should return correct test outputs given test input" do
      SwapElements.new('../../test_input.txt')
      expect($stdout.string).to match('9 2 3 4 5 6 7 8 1')
      expect($stdout.string).to match('2 4 3 1 5 6 7 8 9 10')
    end
  end
end