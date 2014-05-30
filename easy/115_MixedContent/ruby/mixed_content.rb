class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
    @integer_array = Array.new
    @string_array = Array.new
    split_string
  end

  def to_i
    @integer_array
  end

  def to_s
    @string_array
  end

  def join
    return_string = ""
    return_string += @string_array.join(",") unless @string_array.empty?
    return_string += "|" unless empty_set?
    return_string += @integer_array.join(",") unless @integer_array.empty?
    return_string.rstrip
  end

  private

  def split_string
    split_array = @string_to_parse.split(",")
    split_array.each do |value|
      if value.to_i.to_s == value
        @integer_array << value.to_i
      else
        @string_array << value
      end
    end
  end

  def empty_set?
    @string_array.empty? || @integer_array.empty?
  end

end

class MixedContent
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      return_string = parsed_string.join
      puts return_string
    end
  end
end

#MixedContent.new