require 'time'

class DeltaTime
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      time_array = line.strip.split(' ')
      time_1 = Time.parse(time_array[0]).utc
      time_2 = Time.parse(time_array[1]).utc
      diff = Time.at((time_1 - time_2).abs).utc
      puts diff.strftime('%H:%M:%S')
    end
  end
end

# DeltaTime.new
