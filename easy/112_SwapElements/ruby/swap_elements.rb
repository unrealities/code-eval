class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def numbers_array
    number_string = split_numbers_and_actions(@string_to_parse)[:number_string]
    number_string.split
  end

  def actions_array
    action_string = split_numbers_and_actions(@string_to_parse)[:action_string]
    split_action_string(action_string)
  end

  private

  def split_numbers_and_actions(string_to_split)
    split_string = string_to_split.split(":")
    number_string = split_string[0]
    action_string = split_string[1].delete(" ")
    return {number_string: number_string, action_string: action_string}
  end

  def split_action_string(action_string)
    return_array = Array.new
    split_actions = action_string.split(",")
    split_actions.each do |action|
      return_array << action.split("-")
    end
    return_array
  end
end

class SwapArrayValues
  def initialize(numbers_array, actions_array)
    @numbers_array = numbers_array
    @actions_array = actions_array
  end

  def swap(array, first_index, second_index)
    array[first_index], array[second_index] = array[second_index], array[first_index]
    array
  end

  def update
    @actions_array.each do |action|
      @numbers_array = swap(@numbers_array, action[0].to_i, action[1].to_i)
    end
    array_to_string(@numbers_array)
  end

  private

  def array_to_string(array_to_convert)
    return_string = ""
    array_to_convert.each do |number|
      return_string += (number + " ")
    end
    return_string.rstrip
  end
end

class SwapElements
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line)
      numbers_array = parsed_string.numbers_array
      actions_array = parsed_string.actions_array
      swapped_array = SwapArrayValues.new(numbers_array, actions_array).update
      puts swapped_array
    end
  end
endgit

SwapElements.new