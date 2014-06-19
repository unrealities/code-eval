require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('Feb 2004-Dec 2009; Sep 2004-Jul 2008') }
  describe '#simple_date_array' do
    it 'should split array into an array of simple dates' do
      expect(parse_input.simple_date_array).to eq [['Feb 2004', 'Dec 2009'], ['Sep 2004', 'Jul 2008']]
    end
  end

  describe '#array_of_dates' do
    let(:feb_04) { Date.new(2004, 2) }
    let(:dec_09) { Date.new(2009, 12, -1) }
    let(:sep_04) { Date.new(2004, 9) }
    let(:jul_08) { Date.new(2008, 7, -1) }

    it 'should return an array of date objects' do
      expected_array = [[feb_04, dec_09], [sep_04, jul_08]]
      expect(parse_input.array_of_dates).to eq expected_array
    end
  end
end

RSpec.describe CalculateWorkingTime do
  let(:feb_04) { Date.new(2004, 2) }
  let(:dec_09) { Date.new(2009, 12, -1) }
  let(:sep_04) { Date.new(2004, 9) }
  let(:jul_08) { Date.new(2008, 7, -1) }
  let(:calc_work_time) { CalculateWorkingTime.new([[feb_04, dec_09], [sep_04, jul_08]]) }

  describe '#working_years' do
    it 'should return working years given an array of date ranges' do
      expect(calc_work_time.working_years).to eq 5
    end
  end
end

RSpec.describe WorkingExperience do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      WorkingExperience.new('../test_input.txt')
      expect($stdout.string).to match('14')
      expect($stdout.string).to match('19')
      expect($stdout.string).to match('9')
      expect($stdout.string).to match('13')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('4')
      expect($stdout.string).to match('1')
      expect($stdout.string).to match('6')
      expect($stdout.string).to match('0')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('4')
      expect($stdout.string).to match('1')
      expect($stdout.string).to match('6')
      expect($stdout.string).to match('0')
      expect($stdout.string).to match('11')
      expect($stdout.string).to match('7')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('0')
      expect($stdout.string).to match('8')
      expect($stdout.string).to match('20')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('18')
      expect($stdout.string).to match('12')
      expect($stdout.string).to match('7')
      expect($stdout.string).to match('5')
      expect($stdout.string).to match('7')
      expect($stdout.string).to match('10')
      expect($stdout.string).to match('4')
      expect($stdout.string).to match('17')
    end
  end
end
