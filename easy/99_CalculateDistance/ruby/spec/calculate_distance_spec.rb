require_relative '../calculate_distance'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('')}
end

RSpec.describe CalculateDistance do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  it "should return correct test outputs given test input" do
    CalculateDistance.new('../test_input.txt')
    expect($stdout.string).to match('26')
    expect($stdout.string).to match('90')
  end
end