def fib(n)
  return nil if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2
  prev_fib = fib(n - 1)
  prev_fib + [prev_fib[-2] + prev_fib[-1]]
end

def iterative_fib(n)
  return nil if n < 1
  return [1] if n == 1
  fibs = [1, 1]
  until fibs.length == n
    fibs << fibs[-1] + fibs[-2]
  end
  fibs
end
