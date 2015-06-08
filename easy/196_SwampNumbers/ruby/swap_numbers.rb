require 'minitest/autorun'

describe 'SwapNumbers' do
  before do
    $stdout = StringIO.new
  end
  after do
    $stdout = STDOUT
  end
  it 'swaps the prefix and suffix of a word' do
    swap_numbers = SwapNumbers.new('../test_input.txt')
    $stdout.string.must_include '0Always4 8look5 9on4 2the7 8bright4 7side9 8of3 5life5'
    $stdout.string.must_include '5Nobody5 3expects7 4the5 4Spanish6 0inquisition9'
  end
end

class SwapNumber
  def initialize(input)
    @sentence_array = input.split(" ")
  end

  def to_s
    swap_first_and_last_char.join(" ")
  end

  private

  def swap_first_and_last_char
    @sentence_array.map! do |word|
      word_array = word.split("")
      first_char = word_array[0]
      last_char = word_array[word_array.length-1]
      temp_word_array = word_array
      temp_word_array[0] = last_char
      temp_word_array[temp_word_array.length-1] = first_char
      word = temp_word_array.join("")
    end
  end
end

class SwapNumbers
  def initialize(filepath = ARGV[0])
    IO.foreach(filepath) do |line|
      puts SwapNumber.new(line.strip).to_s
    end
  end
end

# SwapNumbers.new
