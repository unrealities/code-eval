class ParseInput
  def initialize(string_to_parse)
    @parsed_string = string_to_parse
  end
end

class MatrixRotation
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      # do work
    end
  end
end

# MatrixRotation.new
