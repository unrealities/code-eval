class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def to_a
    return_array = @string_to_parse.split(",")
    return_array.map!(&:to_i)
  end
end

class ComputeArray
  def initialize(array_to_calc)
    @array_to_calc = array_to_calc
    array_length = array_to_calc.length
    @half_array_length = array_length/2
  end

  #TODO Improve performance of this method. Results in 5 second run time and 21/35 score
  def major_element
    major_element = 'None'
    @array_to_calc.uniq.each do |val|
      if over_half?(val)
        major_element = val.to_s
        break
      end
    end
    major_element
  end

  private

  def over_half?(val)
    @array_to_calc.count(val) > @half_array_length
  end
end

class TheMajorElement
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      computed_array = ComputeArray.new(parsed_string.to_a)
      puts computed_array.major_element
    end
  end
end

TheMajorElement.new