require_relative '../armstrong_numbers'

describe "Armstrong Numbers" do
  describe ParseInput do
    let(:parse_input){ParseInput.new('153')}

    describe "#to_a" do
      it "returns [1, 5, 3]" do
        expect(parse_input.to_a).to eq [1, 5, 3]
      end
    end
  end

  describe CalcInput do
    let(:calc_input){CalcInput.new([1, 5, 3])}

    describe "#n_power_digit_sum" do
      it "returns 153 given [1, 5, 3]" do
        expect(calc_input.length_power_digit_sum).to eq 153
      end
    end

    describe "@armstrong_num" do
      it "returns true given 153" do
        expect(calc_input.armstrong_num?).to eq true
      end
    end
  end

  describe ArmstrongNumbers do
    before do
      $stdout = StringIO.new
    end

    after(:all) do
      $stdout = STDOUT
    end

    it "should return correct test outputs given test input" do
      ArmstrongNumbers.new('../test_input.txt')
      expect($stdout.string).to match('True')
      expect($stdout.string).to match('True')
      expect($stdout.string).to match('False')
    end
  end
end