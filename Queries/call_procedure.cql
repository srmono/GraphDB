CREATE
    (a:Person:Child{name:"Alice", age:20}),
    (b:Person:Parent{name:"Charlie", age:65}),
    (c:Person{name:"Bob", age:27}),
    (d:Person{name:"Dora", age:30}),
    (a)-[:FRIEND_OF]->(c),
    (a)-[:CHILD_OD]->(b)
RETURN *

// Importing variable into subqueries
UNWIND [0, 1, 2] AS x 
CALL {
    WITH x 
    RETURN x * 10 AS y
}
RETURN x, y 

// POST-UNION process
// finds the youngest and oldest person in the databse and order by name 
CALL {
    MATCH (p:Person)
    RETURN p 
    ORDER BY p.age ASC 
    LIMIT 1
UNION
    MATCH (p:Person)
    RETURN p 
    ORDER BY p.age DESC
    LIMIT 1
}
RETURN p.name, p.age 
ORDER BY p.name

// Finds friends and/or parents for each person , 
// subsequenty the number of friends and parents are counted together
MATCH (p:Person)
CALL {
    WITH p
    OPTIONAL MATCH (p)-[:FRIEND_OF]->(other:Person)
    RETURN other
UNION
    WITH p
    OPTIONAL MATCH (p)-[:CHILD_OD]->(other:Parent)
    RETURN other
}
RETURN DISTINCT p.name, count(other)

//Aggregations
//Find the name of each person and the names of their friends
MATCH (p:Person)
CALL{
    WITH p
    MATCH (p)-[:FRIEND_OF]-(c:Person)
    RETURN c.name AS friend 
}
RETURN p.name, friend

MATCH (p:Person)
CALL{
    WITH p
    MATCH (p)--(c)
    RETURN count(c) AS numberOfConnections
}
RETURN p.name, numberOfConnections

// Unit subqueries and side-effects
MATCH (p:Person)
CALL {
    WITH p
    UNWIND range (1,5) AS i
    CREATE (:Person {name: p.name})
}
RETURN count(*)

// Aggregation on imported variables
//counts the number of younger person for each person in the graph

MATCH (p:Person)
CALL{
    WITH p 
    MATCH (other:Person)
    WHERE other.age < p.age 
    RETURN count(other) AS YoungerPersonCount
}
RETURN p.name, YoungerPersonCount