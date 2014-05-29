class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def to_array
    return_array = @string_to_parse.split
    return_array.map(&:to_i)
  end
end

class UpdateSequence
  def initialize(array_to_split)
    @sequence = array_to_split
    @prev_digit = @sequence[0]
    @return_array = Array.new
    @sub_array = Array.new
  end

  def consecutive_subsets
    @sequence.each do |digit|
      if digit_match?(digit)
        @sub_array << digit
      else
        create_new_subarray(digit)
      end
      @prev_digit = digit
    end

    @return_array << @sub_array
  end

  def to_s
    return_string = ""

    consecutive_subsets.each do |subset|
      return_string += length_and_value(subset)
      return_string += " "
    end

    return_string.rstrip
  end

  private

  def digit_match?(digit)
    digit == @prev_digit
  end

  def create_new_subarray(digit)
    @return_array << @sub_array
    @sub_array = Array.new
    @sub_array << digit
  end

  def length_and_value(array_to_parse)
    length_of_array = array_to_parse.length
    value_of_array = array_to_parse[0]
    return "#{length_of_array} #{value_of_array}"
  end
end

class CompressedSequence
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line)
      updated_sequence = UpdateSequence.new(parsed_string.to_array)
      puts updated_sequence.to_s
    end
  end
end

#CompressedSequence.new