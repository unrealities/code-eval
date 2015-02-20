class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def to_a
    return_array = @string_to_parse.split("")
    return_array.map!(&:to_i)
    return_array
  end
end

class CalcInput
  def initialize(calc_array)
    @calc_array = calc_array
    @length = calc_array.length
    @to_i = @calc_array.join.to_i
  end

  def length_power_digit_sum
    return_sum = 0
    @calc_array.each do |digit|
      length_power = digit ** @length
      return_sum += length_power
    end
    return_sum
  end

  def armstrong_num?
    length_power_digit_sum == @to_i
  end
end

class ArmstrongNumbers
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      calc_input = CalcInput.new(parsed_string.to_a)
      puts bool_to_s(calc_input.armstrong_num?)
    end
  end

  private

  def bool_to_s(bool)
    bool.to_s.capitalize
  end
end

#ArmstrongNumbers.new