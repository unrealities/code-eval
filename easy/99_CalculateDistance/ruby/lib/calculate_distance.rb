class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def coord_array
    coord_array = Array.new
    split.each do |coord|
      tmp_array = coord.split(",")
      tmp_array.map!(&:to_i)
      coord_array << tmp_array
    end
    coord_array
  end

  private

  def split
    trimmed_string = @string_to_parse.delete(' ')
    return_array = trimmed_string.split(')(')
    return_array.each do |coord|
      coord.delete!(')')
      coord.delete!('(')
    end
    return_array
  end
end

class CalculateDistance
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      @coordinate_array = parsed_string.coord_array
      puts distance.to_i
    end
  end

  private

  def distance
    x_distance = @coordinate_array[0][0]-@coordinate_array[1][0]
    y_distance = @coordinate_array[0][1]-@coordinate_array[1][1]
    Math.sqrt(x_distance**2+y_distance**2)
  end
end

#CalculateDistance.new