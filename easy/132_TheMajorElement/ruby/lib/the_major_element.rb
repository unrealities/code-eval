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

  def major_element
    count = Hash.new(0)
    major_element = 'None'
    @array_to_calc.each do |val|
      count[val]+=1
      if count[val] > @half_array_length
        major_element = val.to_s
        break
      end
    end
    major_element
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

#TheMajorElement.new