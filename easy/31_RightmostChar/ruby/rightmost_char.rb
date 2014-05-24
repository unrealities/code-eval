class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def sentence
    @string_to_parse.split(",")[0]
  end

  def search_char
    @string_to_parse.split(",")[1]
  end
end

class Search
  def initialize(sentence, search_char)
    @sentence = sentence
    @search_char = search_char
    @search_char = " " if @search_char.nil?
  end
  def rightmost_char_index
    @sentence.reverse!
    reverse_index = @sentence.index(@search_char)

    return -1 if reverse_index.nil?

    return_value = @sentence.size - reverse_index
    return_value-1
  end
end

class RightmostChar
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      search_sentence = Search.new(parsed_string.sentence, parsed_string.search_char)
      puts search_sentence.rightmost_char_index
    end
  end
end

#RightmostChar.new