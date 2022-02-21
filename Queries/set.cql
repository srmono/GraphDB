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
    (e:Swedish{name:"Andy", age:36, hungry:true}),
    (a)-[:KNOWS]->(e),
    (e)-[:KNOWS]->(c),
    (b)-[:KNOWS]->(c)
RETURN *


// Set a property
MATCH (n {name: 'Andy'})
SET n.surname = 'Taylor'
RETURN n.name, n.surname

//Set a propety on a node or relationship using expressions
MATCH (n {name: 'Andy'})
SET (CASE WHEN n.age = 36 THEN n END).worksIn = "Malmo"
RETURN n.name, n.worksIn;

//No action will be taken if the node expression evaluates to null
MATCH (n {name: 'Andy'})
SET (CASE WHEN n.age = 54 THEN n END).worksIn = "Malmo"
RETURN n.name, n.worksIn;

// Update a property
// Change age property, the age prop converted to string
MATCH (n {name: 'Andy'})
SET n.age = toString(n.age)
RETURN n.name, n.age

// Remove a property
MATCH (n {name: 'Andy'})
SET n.name = null
RETURN n.name, n.age;

// Copy properties between nodes and relationships
//Query to replace all the properties of "Peter" to "Andy"
MATCH 
    (at {name: "Andy"}),
    (pn {name: "Peter"})
SET at = pn 
RETURN at.name, at.age, at.hungry, pn.name, pn.age

// Replace all properties using a map and =
MATCH (p {name: 'Peter'})
SET p = {name: "Peter Smith", position: "Entrepreneur"}
RETURN p.name, p.age, p.position

// Remove all properties using an empty map and =
MATCH (p {name: 'Peter'})
SET p = {}
RETURN p.name, p.age

// Mutate specific properties using a map and +=
MATCH (p {name: "Peter"}) 
SET p += {age: 38, hungry: true, position:'Entrepreneur'}
RETURN p.name, p.hungry, p.position

MATCH (p {name: "Peter"}) 
SET p += {}
RETURN p.name, p.hungry, p.position

// Set multiple properties using one SET clause
MATCH (p {name: "Andy"}) 
SET n.position = "Developer", n.surname = "Taylor"
RETURN p

// Set a property using a parameter
//-- surname parameter:
{
    "surname": "Taylor"
}

MATCH (n {name: "Andy"}) 
SET n.surname = $surname 
RETURN n.name, n.surname

// Set all properties using a parameter
{
    "props" : {
        "surname": "Taylor",
        "name": "Andy",
        "position": "Developer"
        .....
    }
}

MATCH (n {name: "Andy"}) 
SET n = $props
RETURN n.name, n.position

// Set a label on a node
MATCH (n {name: "Stefan"})
set n:German
RETURN n.name, labels(n) AS labels

// Set multiple labels on a node
MATCH (n {name: "George"})
set n:Swedish:Bossman
RETURN n.name, labels(n) AS labels