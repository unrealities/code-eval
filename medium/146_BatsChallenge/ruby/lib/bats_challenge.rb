class ParseInput
  attr_reader :length_of_wire, :distance_between_bats, :num_of_bats, :init_bats
  def initialize(string_to_parse)
    array_of_ints = string_to_parse.split(' ').map(&:to_i)
    @length_of_wire = array_of_ints[0]
    @distance_between_bats = array_of_ints[1]
    @num_of_bats = array_of_ints[2]
    @num_of_bats > 0 ? @init_bats = array_of_ints[3..-1] : @init_bats = 0
  end
end

class BatsChallenge
  BUILD_DIST = 6
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      @bats = ParseInput.new(line.strip)
      puts total_new_bats
    end
  end
  
  def total_new_bats
    if @bats.num_of_bats > 0
      new_bats_between_wall_and_first_bat + new_bats_between_last_bat_and_wall + new_bats_between_initial_bats
    else
      all_new_bats
    end
  end
  
  def all_new_bats
    (@bats.length_of_wire - 2*BUILD_DIST) / @bats.distance_between_bats + 1
  end
  
  private
  
  def new_bats_between_wall_and_first_bat
    (@bats.init_bats[0] - BUILD_DIST) / @bats.distance_between_bats
  end
  
  def new_bats_between_last_bat_and_wall
    (@bats.length_of_wire - BUILD_DIST - @bats.init_bats[-1]) / @bats.distance_between_bats
  end
  
  def new_bats_between_initial_bats
    new_bats = 0
    for i in 0..@bats.init_bats.length-2 do
      remaining_distance = @bats.init_bats[i+1] - @bats.init_bats[i] - @bats.distance_between_bats
      new_bats += (remaining_distance) / @bats.distance_between_bats if remaining_distance > 0
    end
    new_bats
  end
end

# BatsChallenge.new
