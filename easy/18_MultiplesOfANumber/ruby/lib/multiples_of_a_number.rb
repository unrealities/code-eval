class ParseInput
  def initialize(string_to_parse)
    @parsed_array = string_to_parse.split(",")
  end

  def number
    @parsed_array[0].to_i
  end

  def multiple
    @parsed_array[1].to_i
  end
end

class Compare
  def initialize(number, multiple)
    @number = number
    @multiple = multiple
  end

  def largest_multiple
    largest_multiple = @multiple

    while largest_multiple < @number
      largest_multiple += @multiple
    end

    largest_multiple
  end
end

class MultiplesOfANumber
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      compare = Compare.new(parsed_string.number, parsed_string.multiple)
      puts compare.largest_multiple
    end
  end
end

#MultiplesOfANumber.new