def max_palindrome_prime_less_than(num)
  max = 2
  prime_numbers_less_than(num).reverse_each do |c|
    if palindrome?(c.to_s)
      max = c
      break
    end
  end
  max
end

def prime_numbers_less_than(max)
  prime_nums = (2..max).to_a
  prime_nums.each do |possible_prime|
    prime_nums.delete_if do |non_prime|
      divmod_result = non_prime.divmod(possible_prime)
      (divmod_result[1] == 0) && (divmod_result[0] != 1)
    end
  end
  prime_nums
end

def palindrome?(s)
  s.reverse == s
end

# puts max_palindrome_prime_less_than 1000
