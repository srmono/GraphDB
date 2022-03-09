// avg() - Numeric values
// The function avg() returns the average of a set of numeric values.

// Syntax: avg(expression)
MATCH (n:Person) 
RETURN avg(n.age)


// collect()
// The function collect() returns a single aggregated list containing the values returned by an expression.

// Syntax: collect(expression)
MATCH (n:Person) 
RETURN collect(n.age)


// count()
// The function count() returns the number of values or rows, and appears in two variants:

// count(*)
// returns the number of matching rows.

// count(expr)
// returns the number of non-null values returned by an expression.

// Syntax: count(expression)
MATCH (n {name: 'A'})-->(x) 
RETURN labels(n), n.age, count(*)


MATCH (n {name: 'A'})-[r]->() 
RETURN type(r), count(*)

MATCH (n {name: 'A'})-->() 
RETURN count(*)

MATCH (n:Person) 
RETURN count(n.age)


MATCH (me:Person)-->(friend:Person)-->(fof:Person)
WHERE me.name = 'A'
RETURN count(DISTINCT fof), count(fof)


// max()
// The function max() returns the maximum value in a set of values.

// Syntax: max(expression)
UNWIND [1,'a', null, 0.2, 'b', '1', '99'] AS val 
RETURN max(val)

UNWIND [[1, 'a', 89], [1,2]] AS val 
RETURN max(val)

MATCH(n:Person)
RETURN max(n.age)

// min()
// The function min() returns the minimum value in a set of values.

// Syntax: min(expression)
MATCH(n:Person)
RETURN min(n.age)


// percentileCont()
// The function percentileCont() returns the percentile of the given value over a group, with a percentile from 0.0 to 1.0. It uses a linear interpolation method, calculating a weighted average between two values if the desired percentile lies between them. For nearest values using a rounding method, see percentileDisc.

// Syntax: percentileCont(expression, percentile)
MATCH(n:Person)
RETURN percentileCont(n.age, 0.4)

// percentileDisc()
// The function percentileDisc() returns the percentile of the given value over a group, with a percentile from 0.0 to 1.0. It uses a rounding method and calculates the nearest value to the percentile. For interpolated values, see percentileCont.

// Syntax: percentileDisc(expression, percentile)
MATCH(n:Person)
RETURN percentileDisc(n.age, 0.5)

// stDev()
// The function stDev() returns the standard deviation for the given value over a group. It uses a standard two-pass method, with N - 1 as the denominator, and should be used when taking a sample of the population for an unbiased estimate. When the standard variation of the entire population is being calculated, stdDevP should be used.

// Syntax: stDev(expression)
MATCH(n:Person)
RETURN stDev(n.age)


// stDevP()
// The function stDevP() returns the standard deviation for the given value over a group. It uses a standard two-pass method, with N as the denominator, and should be used when calculating the standard deviation for an entire population. When the standard variation of only a sample of the population is being calculated, stDev should be used.

// Syntax: stDevP(expression)

MATCH (n)
WHERE n.name IN ['A', 'B', 'C']
RETURN stDevP(n.age)

// sum() - Numeric values
// The function sum() returns the sum of a set of numeric values.

// Syntax: sum(expression)

MATCH (n:Person)
RETURN sum(n.age)

