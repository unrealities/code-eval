require_relative 'spec_helper'

RSpec.describe Drive do
  let(:drive) {Drive.new('########C_##')}

  describe "#checkpoint" do
    it "should return 8" do
      expect(drive.checkpoint).to eq 8
    end
  end

  describe "#gate" do
    it "should return 9" do
      expect(drive.gate).to eq 9
    end
  end

  describe "#path" do
    it "should return 8" do
      expect(drive.path).to eq 8
    end
  end

  describe "#move" do
    it "should have a '|'" do
      expect(drive.move).to eq '|'
    end
  end

  describe "#new_course" do
    it "should return the correctly updated course" do
      expect(drive.new_course).to eq '########|_##'
    end
  end

end

RSpec.describe RacingChars do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe "#initialize" do
    it "should return correct test outputs given test input" do
      RacingChars.new('../test_input.txt')
      expect($stdout.string).to match('#########\|##')
      expect($stdout.string).to match('########/_##')
      expect($stdout.string).to match('#######/####')
      expect($stdout.string).to match(/######_#\\###/)
      expect($stdout.string).to match('#######_\|###')
      expect($stdout.string).to match('#######/####')
      expect($stdout.string).to match('######/#_###')
      expect($stdout.string).to match('######\|_####')
      expect($stdout.string).to match(/#######\\####/)
      expect($stdout.string).to match('#######\|####')
    end
  end
end