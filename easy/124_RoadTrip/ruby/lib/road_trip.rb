class ParseInput
  def initialize(string_to_parse)
    @parsed_string = string_to_parse
  end

  def to_i_a
    return_array = @parsed_string.split(';')
    return_array.map! do |city_distance|
      city_distance.split(',')
    end
    return_array.map! do |city_distance|
      city_distance[1].to_i
    end
  end
end

class CalcPathDistance
  def initialize(array_of_distances)
    @array_of_distances = array_of_distances
    @path_distance_array = Array.new(@array_of_distances.length)
  end

  def calc_path_distance
    @array_of_distances.sort!


    @array_of_distances.each.with_index do |dist, index|
      if index == 0
        @path_distance_array[index] = dist
      else
        @path_distance_array[index] = dist-@array_of_distances[index-1]
      end
    end

    @path_distance_array.join(',')
  end
end

class RoadTrip
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      calc_path_distance = CalcPathDistance.new(parsed_string.to_i_a)
      puts calc_path_distance.calc_path_distance
    end
  end
end

#RoadTrip.new