class ParseInput
  def initialize(string_to_parse)
    @parsed_string = string_to_parse
    @length = @parsed_string.length * 1.00
    @uppercase_count = 0
    @lowercase_count = 0
    get_counts
  end

  def uppercase_percent
    ((@uppercase_count / @length) * 100.0)
  end

  def lowercase_percent
    ((@lowercase_count / @length) * 100.0)
  end

  private

  def get_counts
    @parsed_string.each_char do |char|
      if uppercase?(char)
        @uppercase_count += 1
      else
        @lowercase_count += 1
      end
    end
  end

  def uppercase?(char)
    char.upcase == char
  end
end

class LettercasePercentageRatio
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts "lowercase: %.2f" % parsed_string.lowercase_percent + " uppercase: %.2f" % parsed_string.uppercase_percent
    end
  end
end

# LettercasePercentageRatio.new
