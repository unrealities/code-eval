class CalcMinimumCoins
  COINS = [5, 3, 1]
  attr_reader :coin_total
  
  def initialize(coin_total)
    @coin_total = coin_total
    @min_coins = 0
  end
  
  def min_coins
    remaining_total = @coin_total
    COINS.each do |coin|
      if remaining_total/coin > 0
        @min_coins += remaining_total/coin
        remaining_total %= coin
      end
    end
    @min_coins
  end
  
  def to_s
    puts min_coins
  end
end

class MinimumCoins
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      coin_total = line.strip.to_i
      CalcMinimumCoins.new(coin_total).to_s
    end
  end
end

# MinimumCoins.new
