class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end
end

class MixedContent
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      #doit
    end
  end
end

#MixedContent.new