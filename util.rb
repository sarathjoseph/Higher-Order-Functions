
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

print(block_use,"\n", map_use ,"\n", comprehension)

# Produces the following result
=begin
[2, 3, 5, 7, 11, 13, 17, 19]
[1, 8, 27, 64, 125, 216, 343, 512, 729, 1000]
[1, 9, 25, 49, 81, 121, 169, 225, 289, 361]
=end



