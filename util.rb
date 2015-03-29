
# A higher order function that takes in arrays and numerics and typical blocks in addition to lambdas for  map functions and comprehensions

def higher_order(n)

  list=[]

  if n.is_a? Array
    list=n
  elsif n.is_a? Numeric
    list=[*1..n]
  end
  list.collect { |x|  yield x }.compact

end

# Passing a typical block

block_use = higher_order(20) do |k|

  is_prime=!([*2..Math.sqrt(k)].collect {|r| k%r }.include?0)

  k if k!=1 && is_prime
end

# Passing a lambda having a map function
map_use= higher_order(10) {|x|x**3 }

# Passing a lambda having a comprehension
comprehension= higher_order([*1..20]) {|k| k**2 if k.odd?}

# Prints out the output for the first 20 primes, squares and odd numbers respectively.
print(block_use,"\n", map_use ,"\n", comprehension)

