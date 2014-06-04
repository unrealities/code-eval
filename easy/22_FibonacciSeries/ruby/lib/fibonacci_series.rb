class FibonacciSeries
  def initialize(string_inputs = ARGV[0])
    File.read(string_inputs).split("\n").each do |line|
      @max_fibonacci_index = line.to_i
      if (@max_fibonacci_index>0)
        puts calc_fibonacci
      else
        puts @max_fibonacci_index #because they always give you a blank line and expect zero at the end.
      end
    end
  end

  def calc_fibonacci
    prev_num = 0
    curr_num = 1
    fibonacci = 1

    (@max_fibonacci_index-1).times do
      fibonacci = prev_num + curr_num
      prev_num = curr_num
      curr_num = fibonacci
    end

    fibonacci
  end
end

#FibonacciSeries.new