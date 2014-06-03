class FibonacciSeries
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      max_fibonacci_index = line.to_i
      prev_num = 0
      curr_num = 1
      fibonacci = 1

      (max_fibonacci_index-1).times do
        fibonacci = prev_num + curr_num
        prev_num = curr_num
        curr_num = fibonacci
      end

      puts fibonacci
    end
  end
end

#FibonacciSeries.new