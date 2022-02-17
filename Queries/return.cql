CREATE
    (a{name:"A", age: 55, happy: "Yes!"}),
    (b{name:"B"),
    (a)-[:KNOWS]->(b),
    (a)-[:BLOCKS]->(b)
RETURN *

// Return nodes
MATCH (n {name: "B"})
RETURN n

// Return relationships
MATCH (n {name: "A"})-[r:KNOWS]->(c)
RETURN r

//REturn property
MATCH (n {name: "A"})
RETURN n.name

// Return all the elements
MATCH (a {name: "A"})-[r]->(b)
RETURN *

// Variable with uncommon characters
MATCH (`This isn\'t a common variable`)
WHERE `This isn\'t a common variable`.name = 'A'
RETURN `This isn\'t a common variable`.happy

//Column Alias
MATCH (n {name: "A"})
RETURN n.age AS personAge

//Optional props 
// null if the prop is not there
MATCH (n)
RETURN n.age

// Other expressions
MATCH (n {name: "A"})
RETURN n.age > 30,  "I am a literal", (n)-->()

//Unique results
MATCH (a {name: "A"})-->(b)
RETURN DISTINCT b
