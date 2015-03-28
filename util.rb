
# A higher order function that takes in typical blocks in addition to lambdas for filter and map functions

def higher_order(n)
  res=[]
  [*1..n].each do |x|
    res<<yield(x)
  end
  return res.compact
end

#  Demonstration of different usages

# Passing a typical block

block_use = higher_order(20) do |k|
  filter=[]
  [*2..Math.sqrt(k)].each {|r| filter<<k%r }
  k if k!=1 && !(filter.include?0)
end

# Passing a lambda having a map function
map_use= higher_order(20) {|x|x**2}

# Passing a lambda having a filter function
filter_use= higher_order(20) {|x|x if x.odd?}

# Prints out the output for the first 20 primes, squares and odd numbers respectively.
print(block_use,"\n", map_use ,"\n", filter_use)

