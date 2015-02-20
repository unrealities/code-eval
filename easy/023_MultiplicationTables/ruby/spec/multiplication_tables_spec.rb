require_relative 'spec_helper'

RSpec.describe MultiplicationTables do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      MultiplicationTables.new(12, 4).to_s
      expect($stdout.string).to match('1   2   3   4   5   6   7   8   9  10  11  12')
      expect($stdout.string).to match('2   4   6   8  10  12  14  16  18  20  22  24')
      expect($stdout.string).to match('3   6   9  12  15  18  21  24  27  30  33  36')
      expect($stdout.string).to match('4   8  12  16  20  24  28  32  36  40  44  48')
      expect($stdout.string).to match('5  10  15  20  25  30  35  40  45  50  55  60')
      expect($stdout.string).to match('6  12  18  24  30  36  42  48  54  60  66  72')
      expect($stdout.string).to match('7  14  21  28  35  42  49  56  63  70  77  84')
      expect($stdout.string).to match('8  16  24  32  40  48  56  64  72  80  88  96')
      expect($stdout.string).to match('9  18  27  36  45  54  63  72  81  90  99 108')
      expect($stdout.string).to match('10  20  30  40  50  60  70  80  90 100 110 120')
      expect($stdout.string).to match('11  22  33  44  55  66  77  88  99 110 121 132')
      expect($stdout.string).to match('12  24  36  48  60  72  84  96 108 120 132 144')
    end
  end
end
