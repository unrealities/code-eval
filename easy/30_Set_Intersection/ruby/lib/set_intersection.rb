class ParseInput
  def initialize(string_to_parse)
    @parsed_array = string_to_parse.split(";")
  end

  def array_of_arrays
    @parsed_array.collect! do |array|
      array.split(",").map!(&:to_i)
    end
  end
end

class CompareArrays
  def initialize(array_of_arrays)
    @array1 = array_of_arrays[0]
    @array2 = array_of_arrays[1]
  end

  def intersection
    @array1 & @array2
  end
end

class SetIntersection
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      compared_arrays = CompareArrays.new(parsed_string.array_of_arrays)
      return_array = compared_arrays.intersection
      puts pp(return_array)
    end
  end
  
  private
  
  def pp(array)
    array.nil? ? "" : array.join(",")
  end
end

#SetIntersection.new