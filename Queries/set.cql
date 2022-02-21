// Set a property
// Update a property
// Remove a property
// Copy properties between nodes and relationships
// Replace all properties using a map and =
// Remove all properties using an empty map and =
// Mutate specific properties using a map and +=
// Set multiple properties using one SET clause
// Set a property using a parameter
// Set all properties using a parameter
// Set a label on a node
// Set multiple labels on a node

CREATE
    (a{name:"Stefan"}),
    (b{name:"George"}),
    (c{name:"Peter", age:34}),
    (d{name:"Stefan"}),
    (e:Swedish{name:"Andy", age:36, hungry:true}),
    (a)-[:KNOWS]->(e),
    (e)-[:KNOWS]->(c),
    (b)-[:KNOWS]->(c)
RETURN *