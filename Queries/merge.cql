// The MERGE clause ensures that a pattern exists in the graph. Either the pattern already exists, or it needs to be created.
CREATE
    (a:Person{name:"Charlie Sheen", chauffeurName:'John Brown', bornIn:'New York'}),
    (b:Person{name:"Oliver Stone", chauffeurName:'Bill White', bornIn: 'New York'}),
    (c:Person{name:"Micheal Douglas", chauffeurName:'John Brown', bornIn: 'New Jersy'}),
    (d:Person{name:"Martin Sheen", chauffeurName:'Bob Brown', bornIn:'Ohio'}),
    (e:Person{name:"Rob Reiner", chauffeurName:'Ted Green', bornIn:'New York'}),
    (w:Movie{title:"Wall Street"}),
    (t:Movie{title:"The American Precident"}),
    (a)-[:ACTED_IN]->(w),
    (b)-[:ACTED_IN]->(w),
    (c)-[:ACTED_IN]->(w),
    (d)-[:ACTED_IN]->(w),
    (a)-[:FATHER]->(d),
    (c)-[:ACTED_IN]->(t),
    (d)-[:ACTED_IN]->(t),
    (e)-[:ACTED_IN]->(t)
RETURN *

//Merge single node with label
MERGE (r:Critic)
RETURN r, labels(r)

//Merge single node with properties
MERGE (charlie {name: "Charlie Sheen", age: 10})
RETURN charlie

//Merge single node specifying both label and properties
MERGE (micheal:Person {name: "Micheal Douglas"})
RETURN micheal.name, micheal.bornIn


CREATE INDEX PersonIndex FOR (n:Person) ON (n.name)
//Merge single node derived from an existing node propeprty
MATCH (person:Person)
MERGE (city:City {name: person.bornIn})
RETURN person.name, person.bornIn, city

//// USE ON CREATE AND ON MATCH
//-- MERGE with ON CREATE
MERGE (venkat:Person {name: 'Venkat Bvs'})
ON CREATE 
    SET venkat.created = timestamp()
RETURN venkat.name, venkat.created

//-- MERGE with ON MATCH
// Finds all the Person nodes, set property on them and return them
MERGE (person:Person)
ON MATCH
    SET person.found = true
RETURN person.name, person.found

// MERGE with  ON CREATE and ON MATCH
MERGE (venkat:Person {name: 'Venkat Bvs'})
ON CREATE 
    SET venkat.created = timestamp()
ON MATCH
    SET venkat.lastSeen = timestamp()
RETURN venkat.name, venkat.created, venkat.lastSeen

// MERGE with ON MATCH setting multiple proeprties
MERGE (person:Person)
ON MATCH
    SET 
        person.found = true,
        person.lastAccessed = timestamp()
RETURN person.name, person.found, person.lastAccessed

/// Merge Relationships
MATCH
    (c:Person {name: 'Charlie Sheen'}),
    (w:Movie {title: 'Wall Street'})
MERGE (c)-[r:ACTED_IN]->(w)
RETURN c.name, type(r), w.title


/// Merge with multiple Relationships
MATCH
    (o:Person {name: 'Oliver Stone'}),
    (r:Movie {title: 'Rob Reiner'})
MERGE (o)-[:DIRECTED]->(movie:Movie)<-[:ACTED_IN]-(r)
RETURN movie

// MERGE on an undirected relationship
MATCH
    (c:Person {name: 'Charlie Sheen'}),
    (o:Person {name: 'Oliver Stone'})
MERGE (c)-[r:KNOWS]->(o)
RETURN r 

//MERGE on a relationship between two existing nodes
MATCH (person:Person)
MERGE (city:City {name: person.bornIn})
MERGE (person)-[r:BORN_IN]->(city)
RETURN person.name, person.bornIn, city

// Merge on relationship between an existing node and a merged node derived from node prop
MATCH (person:Person)
MERGE (person)-[r:HAS_CHAUFFEUR]->(chauffeur:Chaufeur {name: person.chauffeurName})
RETURN person.name, person.chauffeurName, chauffeur

//Using unique constraints with Merge

CREATE CONSTRAINT FOR (n:Person) REQUIRE n.name IS UNIQUE;
CREATE CONSTRAINT FOR (n:Person) REQUIRE n.role IS UNIQUE;

//MERGE using unique constraints create a new node if node is not found

MERGE (laurence:Person {name: "Laurence"})
RETURN laurence.name

//MERGE using unique constraints matches an existing node
MERGE (oliver:Person {name: "Oliver Stone"})
RETURN oliver.name, oliver.bornIn

//MERGE using unique constraints partial matches
// Merge using unique constraints fail when finding partial matches

MERGE (micheal:Person {name: "Micheal Douglas", role: "Gordon"})
RETURN micheal

// if you want to set role 

MERGE (micheal:Person {name: "Micheal Douglas"})
SET micheal.role = "Gordon"

//MERGE with  unique constraints  fails when finding conflicting matches
MERGE (oliver:Person {name: "Oliver Stone", role:"role name"})
RETURN oliver



// Using map with merge

//Parameter
{
    "param":{
        "name": "venkat"
        "role": "Trainer"
        ......
    }
}

MERGE (person:Person {name: $param.name, role: $param.role} )
RETURN person.name, person.role

