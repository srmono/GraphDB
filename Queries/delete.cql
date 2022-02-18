// Delete queries

MATCH (n:Employee {name: "John"}) 
DELETE n 

MATCH (n:Employee {name: "John"}) 
DETACH
DELETE n 

// Remove
MATCH (n:Employee { name:"Tony"})
REMOVE n.position
RETURN properties(n)

// 

MATCH (n:Employee { name:"Tony"})
SET n.position = null, n.age = null
RETURN properties(n)



//// Refer Delete Clause Graph (picture)
// Delete a single node
// Delete all nodes and relationships
// Delete a node with all its relationships
// Delete relationships only

//Delete single node
MATCH (n:Person {name: 'UNKNOWN'})
DELETE n

//Delete all nodes and relationships
// This query is not for deleting large amounts of data, 
// but is useful when experimenting with small example data sets.
MATCH (n)
DETACH DELETE n

//Delete a node with all its relationships
//When you want to delete a node and any relationship going to or from it, use DETACH DELETE.
MATCH (n {name: 'Andy'})
DETACH DELETE n

// Delete relationships only
MATCH (n {name: 'Andy'})-[r:KNOWS]->()
DELETE r