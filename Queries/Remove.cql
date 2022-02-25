//The REMOVE clause is used to remove properties from nodes and relationships, and to remove labels from nodes.
//Refer graph remove_graph.png

//Remove a property
MATCH (a {name: 'Andy'})
REMOVE a.age
RETURN a.name, a.age

//Remove all properties
MATCH (n {name: 'Peter'})
REMOVE n:German
RETURN n.name, labels(n)

//Remove multiple labels from a node
MATCH (n {name: 'Peter'})
REMOVE n:German:Swedish
RETURN n.name, labels(n)


