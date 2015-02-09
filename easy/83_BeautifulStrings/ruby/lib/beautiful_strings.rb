class ParseInput
  def initialize(string_to_parse)
    @normalized_string = string_to_parse.gsub(/[^[:alpha:]]/,'').downcase
  end
  
  def char_hash
    char_hash = Hash.new(0)
    @normalized_string.each_char do |char|
      char_hash[char] += 1
    end
    char_hash
  end
end

class BeautifulStrings
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      @value_array = parsed_string.char_hash.values.sort { |x,y| y <=> x }
      puts most_beautiful
    end
  end
  
  def most_beautiful
    max_beauty = 26
    most_beautiful = 0

    @value_array.each do |val|
      most_beautiful += max_beauty * val
      max_beauty -= 1
    end
    
    most_beautiful
  end
end

# BeautifulStrings.new
