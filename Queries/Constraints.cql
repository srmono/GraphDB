// Unique node property Constraints
// Node property Existence Constraints
// Relationship Property Existence Constraints
// Node key Constraints

CREATE CONSTRAINT email_constraint 
ON (n:Person) ASSERT n.email IS UNIQUE 

// CREATE CONSTRAINT ON (n:Person) ASSERT EXISTS (n.email)

CREATE (n:Person {name: "Venkat", phone:"9035351965", email: "bvsrao91@gmail.com"})


CREATE CONSTRAINT exist_constraint 
ON (n:Developer) ASSERT EXISTS (n.qualification)

CREATE (n:Developer {name: "Greeshma", phone:"67768686"})

//Enforcing proeprty existence on Relationship

CREATE CONSTRAINT constraint_relationship 
ON ()-[r:ORDERED]->() ASSERT EXISTS (r.discount)

CREATE (n:Customer)-[o:ORDERED]->(m:Mobile)

CREATE (n:Customer)-[o:ORDERED {discount:"50%"}]->(m:Mobile)

// Node Key Constraints
CREATE CONSTRAINT constraint_sets 
ON (n:Product)  ASSERT (n.name, n.price) IS NODE KEY

CREATE (p:Product {name: "IPhone", discount: "5%"})