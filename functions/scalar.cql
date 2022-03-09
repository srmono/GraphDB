// coalesce()
// The function coalesce() returns the first non-null value in the given list of expressions.

// Syntax: coalesce(expression [, expression]*)

coalesce(expression, [, expression]*)

MATCH (n)
WHERE n.name = 'Alice'
RETURN coalesce(n.hairColor, n.eyesss)

// endNode()
// The function endNode() returns the end node of a relationship.

// Syntax: endNode(relationship)

MATCH (x:Developer)-[r]-()
RETURN endNode(r)

// head()
// The function head() returns the first element in a list.

// Syntax: head(expression)
MATCH (a)
WHERE a.name = "Eskil"
RETURN a.liked_colors, head(a.liked_colors)


// id()
// The function id() returns a node or a relationship identifier, unique by an object type and a database.
MATCH (a)
RETURN id(a)

// last()
// The function last() returns the last element in a list.

// Syntax: last(expression)
MATCH (a)
WHERE a.name = "Eskil"
RETURN a.liked_colors, last(a.liked_colors)

// length()
// The function length() returns the length of a path.

// Syntax: length(path)
MATCH p = (a)-->(b)-->(c)
WHERE a.name = 'Alice'
RETURN length(p)

// properties()
// The function properties() returns a map containing all the properties; the function can be utilized for a relationship or a node. If the argument is already a map, it is returned unchanged.

// Syntax: properties(expression)

CREATE (p:Person {name: "Stefan", city: "Berlin"})
RETURN properties(p)


// randomUUID()
// The function randomUUID() returns a randomly-generated Universally Unique Identifier (UUID), also known as a Globally Unique Identifier (GUID). This is a 128-bit value with strong guarantees of uniqueness.

// Syntax: randomUUID()
RETURN randomUUID() AS UUID


// size()
// The function size() returns the number of elements in a list.

// Syntax: size(list)
RETURN size(['a','b'])


// size() applied to pattern expression
// This is the same function size() as described above, but you pass in a pattern expression, instead of a list. The function size will then calculate on a list of paths.

// Syntax: size(pattern expression)
MATCH (a)
WHERE a.name = "Alice"
RETURN size((a)-->()-->()) AS data


// size() applied to string
// The function size() returns the number of Unicode characters in a string.

// Syntax: size(string)
MATCH (a)
WHERE size(a.name) > 6
RETURN size(a.name), a.name

// startNode()
// The function startNode() returns the start node of a relationship.

// Syntax: startNode(relationship)
MATCH (x:Developer)-[r]-()
RETURN startNode(r)

// timestamp()
// The function timestamp() returns the difference, measured in milliseconds, between the current time and midnight, January 1, 1970 UTC.

// It is the equivalent of datetime().epochMillis.

RETURN timestamp()

// toBoolean()
// The function toBoolean() converts a string, integer or boolean value to a boolean value.

// Syntax: toBoolean(expression)

RETURN toBoolean('true'), toBoolean('not a boolean'), toBoolean(0)