class SumOfPrimes
  def initialize(num_of_primes)
    @num_of_primes = num_of_primes
    puts first_n_primes.inject(&:+)
  end

  def first_n_primes
    return_array = Array.new
    num = 2
    while (return_array.length < @num_of_primes)
      return_array << num if is_prime?(num)
      num +=1
    end
    return_array
  end

  def is_prime?(num)
    2.upto(Math.sqrt(num)) do |val|
      return false if num % val == 0
    end
    true
  end
end
#SumOfPrimes.new(1000)