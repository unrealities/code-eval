class ParseInput
  attr_reader :array_to_reverse, :reverse_length
  def initialize(string_to_parse)
    parsed_input = string_to_parse.split(';')
    @array_to_reverse = parsed_input[0].split(',')
    @reverse_length = parsed_input[1].to_i
  end
end

class Calc
  def initialize(array_to_reverse, reverse_length)
    @arr = array_to_reverse
    @length = reverse_length
    @remaining_length = @arr.length
    @new_arr = Array.new
  end
  
  def to_s
    reverse_sub_array.join(',')
  end
  
  private
  
  def reverse_sub_array
    i = 0
    while @remaining_length >= @length
      @new_arr[i..i+@length-1] = @arr[i..i+@length-1].reverse
      @remaining_length -= @length
      i += @length
    end
    @new_arr += @arr[i..-1]
  end
end

class ReverseGroups
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts Calc.new(parsed_string.array_to_reverse, parsed_string.reverse_length).to_s
    end
  end
end

# ReverseGroups.new