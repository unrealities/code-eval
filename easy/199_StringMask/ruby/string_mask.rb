require 'minitest/autorun'

describe 'string_mask' do
  it '#initialize' do
    input = 'hello 11001'

    string_mask = StringMask.new(input)

    assert_equal('hello', string_mask.word)
    assert_equal('11001', string_mask.binary_map)
  end

  it '#to_s' do
    input = 'hello 11001'

    string_mask = StringMask.new(input)

    assert_equal('HEllO', string_mask.to_s)
  end
end

describe 'string_masks' do
  before do
    $stdout = StringIO.new
  end

  after do
    $stdout = STDOUT
  end

  it 'should return correct test outputs given test input' do
    StringMasks.new('../test_input.txt')
    $stdout.string.must_include('HEllO')
    $stdout.string.must_include('World')
    $stdout.string.must_include('CBA')
  end
end

class StringMask
  attr_reader :word, :binary_map

  def initialize(input)
    split_input = input.split(" ")
    @word = split_input[0]
    @binary_map = split_input[1]
  end

  def to_s
    return_string = @word.split("")
    return_string.map!.with_index do |char, i|
      @binary_map.split("")[i] == '1' ? char.upcase : char
    end
    return_string.join("")
  end
end

class StringMasks
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts StringMask.new(line.strip).to_s
    end
  end
end

#StringMasks.new
