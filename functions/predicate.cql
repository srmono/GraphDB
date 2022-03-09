// all()
// The function all() returns true if the predicate holds for all elements in the given list. null is returned if the list is null or all of its elements are null.

// Syntax: all(variable IN list WHERE predicate)

//All nodes in the returned paths will have a property age with a value larger than 30.
MATCH p = (a)-[*1..3]->(b)
WHERE 
    a.name = 'Alice'
    AND b.name = 'Daniel'
    AND all(x IN nodes(p) WHERE x.age > 30)
RETURN p

// any()
// The function any() returns true if the predicate holds for at least one element in the given list. null is returned if the list is null or all of its elements are null.

// Syntax: any(variable IN list WHERE predicate)


//returns nodes with the property liked_colors (as a list), where at least one element has the value 'yellow'.
MATCH (n)
WHERE any(color IN n.liked_colors WHERE color = 'yellow')
RETURN n


// exists()
// The function exists() returns true if a match for the given pattern exists in the graph, or if the specified property exists in the node, relationship or map. null is returned if the input argument is null.

// Syntax: exists(pattern-or-property)

//The names of all nodes with the name property are returned, along with a boolean (true or false) indicating if they are married.
MATCH (n)
WHERE exists(n.name)
RETURN 
    n.name AS name,
    exists((n)-[:MARRIED]->()) AS is_married

//Three nodes are returned: one with a property name, one without a property name, and one that does not exist (e.g., is null). 
//This query exemplifies the behavior of exists() when operating on null nodes.
MATCH 
    (a),(b)
WHERE 
    exists(a.name)
    AND NOT exists(b.name)
OPTIONAL MATCH (c:DoesNotExists)
RETURN 
    a.name AS a_name,
    b.name AS b_name,
    exists(b.name) AS b_has_name,
    c.name AS c_name,
    exists(c.name) AS c_has_name
ORDER BY a_name, b_name, c_name
LIMIT 1



// isEmpty()
// The function isEmpty() returns true if the given list or map contains no elements or if the given string contains no characters.

MATCH (n)
WHERE NOT isEmpty(n.liked_colors)
RETURN n

//nodes that doesn't have any props are returned
MATCH (n)
WHERE isEmpty(properties(n))
RETURN n


MATCH (n)
WHERE isEmpty(n.eyes)
RETURN n.age AS AGE


// none()
// The function none() returns true if the predicate does not hold for any element in the given list. null is returned if the list is null or all of its elements are null.

// Syntax: none(variable IN list WHERE predicate)

//No node in the returned paths has a property age with the value 25.
MATCH p = (a)-[*1..3]->(b)
WHERE 
    a.name = 'Alice'
    AND none(x IN nodes(p) WHERE x.age = 25)
RETURN p

// single()
// The function single() returns true if the predicate holds for exactly one of the elements in the given list. null is returned if the list is null or all of its elements are null.

// Syntax: single(variable IN list WHERE predicate)

//n every returned path there is exactly one node that has a property eyes with the value 'blue'.
MATCH p = (n)-->(b)
WHERE 
    n.name = "Alice"
    AND single(var IN nodes(p) WHERE var.eyes = "blue")
RETURN p