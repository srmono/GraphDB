//keys()

// keys()
// keys returns a list containing the string representations for all the property names of a node, relationship, or map.

// Syntax: keys(expression)

//A list containing the names of all the properties on the node bound to a is returned.
MATCH (a) WHERE a.name = 'Alice'
RETURN keys(a)

// labels()
// labels returns a list containing the string representations for all the labels of a node.

// Syntax: labels(node)
MATCH (a) WHERE a.name = 'Alice'
RETURN labels(a)

// nodes()
// nodes() returns a list containing all the nodes in a path.

// Syntax: nodes(path)
MATCH p = (a)-->(b)-->(c)
WHERE a.name = 'Alice' AND c.name = "Eskil"
RETURN nodes(p)

// range()
// range() returns a list comprising all integer values within a range bounded by a start value start and end value end, where the difference step between any two consecutive values is constant; i.e. an arithmetic progression. To create ranges with decreasing integer values, use a negative value step. The range is inclusive for non-empty ranges, and the arithmetic progression will therefore always contain start and — depending on the values of start, step and end — end. The only exception where the range does not contain start are empty ranges. An empty range will be returned if the value step is negative and start - end is positive, or vice versa, e.g. range(0, 5, -1).

// Syntax: range(start, end [, step])
RETURN range(0,10), range(2, 18, 3), range(0, 5, -1)


// reduce()
// reduce() returns the value resulting from the application of an expression on each successive element in a list in conjunction with the result of the computation thus far. This function will iterate through each element e in the given list, run the expression on e — taking into account the current partial result — and store the new partial result in the accumulator. This function is analogous to the fold or reduce method in functional languages such as Lisp and Scala.

// Syntax: reduce(accumulator = initial, variable IN list | expression)
MATCH p = (a)-->(b)-->(c)
WHERE a.name ='Alice' AND b.name = "Bob" AND c.name = "Daniel"
RETURN reduce(totalAge = 0, n IN nodes(p) | totalAge + n.age) AS reducedAGe


// relationships()
// relationships() returns a list containing all the relationships in a path.

// Syntax: relationships(path)
MATCH p = (a)-->(b)-->(c)
WHERE a.name = 'Alice' AND c.name = "Eskil"
RETURN relationships(p)


// reverse()
// reverse() returns a list in which the order of all elements in the original list have been reversed.

// Syntax: reverse(original)
WITH [344,"bac",456,null, 8989] AS ids 
RETURN reverse(ids)


// tail()
// tail() returns a list lresult containing all the elements, excluding the first one, from a list list.

// Syntax: tail(list)

MATCH (a) WHERE a.name = "Eskil"
RETURN a.array, tail(a.liked_colors)