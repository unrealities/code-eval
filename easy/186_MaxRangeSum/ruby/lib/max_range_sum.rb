class MaxRangeSums
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts MaxRangeSum.new(line.strip).to_s
    end
  end
end

class MaxRangeSum
  def initialize(input_string)
    parse_input(input_string)
    @max_start = @gains_array.length - @days
  end

  def parse_input(input_string)
    split_line = input_string.split(';')
    @days = split_line[0].to_i
    @gains_array = split_line[1].split(' ').map(&:to_i)
  end

  def max_gain
    max_gain = 0
    for g in (0..@max_start)
      new_gain = @gains_array[g..g+@days-1].reduce(:+)
      max_gain = new_gain if new_gain > max_gain
    end
    max_gain
  end

  def to_s
    max_gain.to_s
  end
end

# MaxRangeSums.new
