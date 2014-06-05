class ParseInput
  def initialize(string_to_parse)
    @parsed_array = string_to_parse.split
  end

  def score_array
    @parsed_array.map(&:to_i)
  end
end

class CalcArray
  def initialize(calc_array)
    @calc_array = calc_array
  end

  def count_array_for_digits_1_to_9
    count_array_for_digits_1_to_9 = Array.new(9, 0)
    @calc_array.each do |digit|
      count_array_for_digits_1_to_9[digit-1] += 1
    end
    count_array_for_digits_1_to_9
  end

  def winner
    winner = 0 #no winner
    count_array_for_digits_1_to_9.each_index do |digit|
      if count_array_for_digits_1_to_9[digit] == 1
        winning_digit = digit + 1
        winner = @calc_array.index(winning_digit) + 1
        break
      end
    end
    winner
  end

end

class LowestUniqueNumber
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      calc_array = CalcArray.new(parsed_string.score_array)
      puts calc_array.winner
    end
  end
end

#LowestUniqueNumber.new