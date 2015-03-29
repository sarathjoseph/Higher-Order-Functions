
# A higher order function that takes in typical blocks in addition to lambdas for filter and map functions

def higher_order(n)

  [*1..n].collect { |x| yield x }.compact

end

# Passing a typical block

block_use = higher_order(20) do |k|

  is_prime=!([*2..Math.sqrt(k)].collect {|r| k%r }.include?0)

  k if k!=1 && is_prime
end

# Passing a lambda having a map function
map_use= higher_order(20) {|x|x**2}

# Passing a lambda having a filter function
filter_use= higher_order(20) {|x|x if x.odd?}

# Prints out the output for the first 20 primes, squares and odd numbers respectively.
print(block_use,"\n", map_use ,"\n", filter_use)

