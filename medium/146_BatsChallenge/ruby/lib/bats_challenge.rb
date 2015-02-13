class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end
end

class BatsChallenge
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts BatsChallenge.new
    end
  end
end

# BatsChallenge.new
