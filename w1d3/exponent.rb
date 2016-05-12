def exponent1(num, exp)
  return 1 if exp == 0
  num * exponent1(num, exp - 1)
end

def exponent2(num, exp)
  return 1 if exp == 0
  if exp.even?
    even_power = exponent2(num, (exp / 2))
    even_power * even_power
  elsif exp.odd?
    odd_power = exponent2(num, (exp / 2))
    num * odd_power * odd_power
  end
end
