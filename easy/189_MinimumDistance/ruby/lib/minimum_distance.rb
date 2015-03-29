class MinimumDistance
  def initialize(input)
    @location_array = input.split(' ')[1..-1].map(&:to_i)
    @min = @location_array.min
    @max = @location_array.max
  end

  def min_sum
    curr_location = @min
    min_sum = @max * @location_array.length

    while curr_location <= @max do
      curr_sum = 0
      @location_array.each do |l|
        curr_sum += (l-curr_location).abs
      end
      min_sum = curr_sum if curr_sum < min_sum
      curr_location += 1
    end

    min_sum
  end

  def to_s
    puts min_sum
  end
end

class MinimumDistances
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      MinimumDistance.new(line.strip).to_s
    end
  end
end

#MinimumDistances.new
