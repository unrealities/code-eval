class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end
end

class NumberOfOnes
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts NumberOfOnes.new
    end
  end
end

# NumberOfOnes.new
