class ParseInput
  attr_reader :x, :y, :n
  def initialize(string_to_parse)
    split_array = string_to_parse.split(' ').map(&:to_i)
    @x = split_array[0]
    @y = split_array[1]
    @n = split_array[2]
  end
end

class CalcFizzBuzz
  def initialize(x, y, n)
    @x = x
    @y = y
    @fb_array = Array.new(n)
  end
  
  def calc
    @fb_array.each_index do |i|
      num = i + 1
      if (num % @x == 0) && (num % @y == 0)
        @fb_array[i] = 'FB'
      elsif (num % @x == 0)
        @fb_array[i] = 'F'
      elsif (num % @y == 0)
        @fb_array[i] = 'B'
      else
        @fb_array[i] = num.to_s
      end
    end
  end
  
end

class FizzBuzz
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts CalcFizzBuzz.new(parsed_string.x, parsed_string.y, parsed_string.n).calc.join(' ')
    end
  end
end

# FizzBuzz.new
