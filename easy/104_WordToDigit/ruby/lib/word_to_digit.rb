class ParseInput
  def initialize(string_to_parse)
    @parsed_array = string_to_parse.split(";")
  end

  def to_a
    @parsed_array
  end
end

class Convert
  ONES = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

  def initialize(array_to_parse)
    @array_to_parse = array_to_parse
  end

  def de_humanize
    return_array = Array.new
    @array_to_parse.each do |num|
      return_array << ONES.index(num)
    end
    return_array
  end
end

class WordToDigit
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      convert = Convert.new(parsed_string.to_a)
      puts convert.de_humanize.join
    end
  end
end

#WordToDigit.new