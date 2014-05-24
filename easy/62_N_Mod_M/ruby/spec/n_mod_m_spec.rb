require_relative '../n_mod_m'

describe "n_mod_m" do
  describe ParseInput do
    let(:parse_input){ParseInput.new('20,6')}

    describe "#numerator" do
      it "returns '20'" do
        expect(parse_input.numerator).to eq '20'
      end
    end

    describe "#denominator" do
      it "returns '6'" do
        expect(parse_input.denominator).to eq '6'
      end
    end
  end

  describe Mod do
    describe "#remainder" do
      it "returns 2 given 20,6" do
        expect(Mod.new(20, 6).remainder).to eq 2
      end
    end
  end

  describe NModM do
    before do
      $stdout = StringIO.new
    end

    after(:all) do
      $stdout = STDOUT
    end

    it "should return correct test outputs given test input" do
      NModM.new('../test_input.txt')
      expect($stdout.string).to match('2')
      expect($stdout.string).to match('2')
    end
  end
end