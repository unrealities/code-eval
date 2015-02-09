class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end
end

class DecodeNumbers
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts DecodeNumbers.new
    end
  end
end

# DecodeNumbers.new
