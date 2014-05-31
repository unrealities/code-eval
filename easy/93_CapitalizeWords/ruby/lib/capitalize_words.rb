class ParseInput
  def initialize(string_to_parse)
    @split_result = string_to_parse.split
  end

  def to_caps
    @split_result.collect! do |word|
      word[0] = word[0].capitalize
      word
    end
    @split_result.join(" ")
  end
end

class CapitalizeWords
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts parsed_string.to_caps
    end
  end
end

#CapitalizeWords.new