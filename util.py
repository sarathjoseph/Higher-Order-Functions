def higher_order(iterable, function):
	
	if not iterable:return []
	iter=[]

	if hasattr(iterable, '__iter__'):iter=iterable

	elif isinstance( iterable, int ):iter=range(iterable)

	if isinstance (function(iter[0]), bool):return [x for x in iter if function(x)]
	
	return [function(x) for x in iter if not function(x)==None]

# takes a mapper function
e1=higher_order(range(5),lambda x:x*x)

# takes a filter function

e2=higher_order(10,lambda k: k%2==0)

# prints out odd squares
e3= higher_order(10,lambda x:x*x if not x%2==0 else None)

print( e1, e2, e3)

"""

Outputs
([0, 1, 4, 9, 16], [0, 2, 4, 6, 8], [1, 9, 25, 49, 81])

"""