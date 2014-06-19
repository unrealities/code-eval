require 'date'

class ParseInput
  def initialize(string_to_parse)
    @parsed_string = string_to_parse
  end

  def simple_date_array
    return_array = @parsed_string.split(';')
    return_array.map! do |dates|
      dates.split('-')
    end
    return_array.map! do |dates|
      dates.map!(&:strip)
    end
  end

  def array_of_dates
    simple_date_array.map! do |dates|
      dates.map! do |date|
        if dates.index(date) == 0
          Date.parse(date)
        else
          first_of_the_month = Date.parse(date)
          Date.new(first_of_the_month.year, first_of_the_month.month, -1)
        end
      end
    end
  end
end

class CalculateWorkingTime
  def initialize(array_of_date_ranges)
    @array_of_date_ranges = array_of_date_ranges
    restart_compare_range_loop
  end

  def working_years
    while @array_of_date_ranges.length > @current_date_range do
      while @next_date_range < @array_of_date_ranges.length do
        if overlap?([@array_of_date_ranges[@current_date_range],
                     @array_of_date_ranges[@next_date_range]])
          condense_date_ranges(@current_date_range, @next_date_range)
          restart_compare_range_loop
        else
          @next_date_range += 1
        end
      end
      @current_date_range += 1
      increase_next_date_range
    end

    calc_years
  end

  private

  def restart_compare_range_loop
    @current_date_range = 0
    increase_next_date_range
  end

  def increase_next_date_range
    @next_date_range = @current_date_range + 1
  end

  def overlap?(array_of_date_ranges)
    (array_of_date_ranges[1].min <= array_of_date_ranges[0].max &&
    array_of_date_ranges[1].min >= array_of_date_ranges[0].min) ||
    (array_of_date_ranges[0].min <= array_of_date_ranges[1].max &&
    array_of_date_ranges[0].min >= array_of_date_ranges[1].min)
  end

  def condense_date_ranges(first_index_to_condense, second_index_to_condense)
    flattened_dates = [@array_of_date_ranges[first_index_to_condense],
                       @array_of_date_ranges[second_index_to_condense]].flatten
    condensed_range = [flattened_dates.min, flattened_dates.max]
    @array_of_date_ranges.delete_at(second_index_to_condense)
    @array_of_date_ranges.delete_at(first_index_to_condense)
    @array_of_date_ranges.unshift(condensed_range)
  end

  def calc_years
    new_array = []

    @array_of_date_ranges.each do |date_range|
      new_array << (date_range[1]-date_range[0]).to_i
    end

    # needed to add '.round(1).truncate' to get all the cases to work.
    (new_array.reduce(:+)/365.to_f).round(1).truncate
  end
end

class WorkingExperience
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      array_of_dates = parsed_string.array_of_dates
      calc_work_time = CalculateWorkingTime.new(array_of_dates)
      puts calc_work_time.working_years
    end
  end
end

#WorkingExperience.new