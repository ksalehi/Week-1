require_relative 'subsets'


def make_change(amount, coins = [25, 10, 5, 1])
  results = []
  coins.subsets.each do |subset|
    next if subset.empty?
    results << biggest_coin(amount, subset)
  end
  results.sort_by { |a| a.length }.first
end

def biggest_coin(amount, coins)
  biggest_coin = nil
  num_coins = 0
  coins.each do |coin|
    num_coins = amount / coin
    if num_coins > 0
      biggest_coin = coin
      break
    end
  end
  remainder = amount - biggest_coin * num_coins
  smaller_change = []
  smaller_change = make_change(remainder, coins) if remainder > 0
  Array.new(num_coins, biggest_coin) + smaller_change
end
