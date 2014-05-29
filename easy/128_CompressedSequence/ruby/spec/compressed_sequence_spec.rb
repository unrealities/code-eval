require_relative '../compressed_sequence'

describe "compressed sequence" do
  describe ParseInput do
    let(:parse_input){ParseInput.new('73 73 73 73 41 41 41 41 41 41 41 41 41 41')}

    describe "#to_array" do
      it "returns [73, 73, 73, 73, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41]" do
        expect(parse_input.to_array).to eq [73, 73, 73, 73, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41]
      end
    end
  end

  describe UpdateSequence do
    let(:update_sequence){UpdateSequence.new([5, 5, 5, 2, 2, 1])}
    describe "#conesecutive_subsets" do
      it "returns [[5, 5, 5], [2, 2], [1]] given [5, 5, 5, 2, 2, 1]" do
        expect(update_sequence.consecutive_subsets).to eq [[5, 5, 5], [2, 2], [1]]
      end
    end

    describe "#to_string" do
      it "returns '3 5 2 2 1 1' given [5, 5, 5, 2, 2, 1]" do
        expect(update_sequence.to_s).to eq '3 5 2 2 1 1'
      end
    end
  end

  describe CompressedSequence do
    before do
      $stdout = StringIO.new
    end

    after(:all) do
      $stdout = STDOUT
    end

    it "should return correct test outputs given test input" do
      CompressedSequence.new('../test_input.txt')
      expect($stdout.string).to match('4 40 8 29 2 57 5 92 10 86')
      expect($stdout.string).to match('4 73 10 41')
      expect($stdout.string).to match('2 1 3 3 4 2 3 14 3 11 1 2')
      expect($stdout.string).to match('1 7')
    end
  end
end