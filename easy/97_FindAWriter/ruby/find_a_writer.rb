class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def encoded_string
    split_encoded_and_keys(@string_to_parse)[:encoded_string]
  end

  def keys_array
    keys_string = split_encoded_and_keys(@string_to_parse)[:keys_string]
    split_keys_string(keys_string)
  end

  private

  def split_encoded_and_keys(string_to_split)
    split_string = string_to_split.split("|")
    encoded_string = split_string[0]
    keys_string = split_string[1]
    return {encoded_string: encoded_string, keys_string: keys_string}
  end

  def split_keys_string(keys_string)
    split_keys = keys_string.split
    split_keys.each.map(&:to_i)
  end
end

class Decode
  def initialize(string_to_decode, key_array)
    @string_to_decode = string_to_decode
    @key_array = key_array
  end

  def decoded_string
    decoded_string = ""
    @key_array.each do |key|
      decoded_string += @string_to_decode[key-1]
    end
    decoded_string
  end

end

class FindAWriter
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line)
      decode = Decode.new(parsed_string.encoded_string, parsed_string.keys_array)
      puts decode.decoded_string
    end
  end
end

FindAWriter.new