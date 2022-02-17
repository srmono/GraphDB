CREATE
    (v:Person{name:"Oliver Stone"}),
    (v1:Person{name:"Micheal Douglas"}),
    (v2:Person{name:"Charlie Sheen"}),
    (v3:Person{name:"Martin Sheen"}),
    (v4:Person{name:"Rob Reiner"}),
    (M:Movie{title:"Wall Street"}),
    (M1:Movie{title:"The American Precident"}),
    (v)-[:DIRECTED]->(M),
    (v1)-[:ACTED_IN{role:"Gordan Gekko"}]->(M),
    (v2)-[:ACTED_IN{role:"Bud Fox"}]->(M),
    (v3)-[:ACTED_IN{role:"Carl Fox"}]->(M),
    (v1)-[:ACTED_IN{role:"President Andrew"}]->(M1),
    (v3)-[:ACTED_IN{role:"A.J. Mac"}]->(M1),
    (v4)-[:DIRECTED]->(M1)
RETURN *

//// Basic node finding
// -*-  Get all nodes
	MATCH(n) RETURN n

// -*-  Get all nodes with a label
-- Return all the movies in database

	MATCH (movie:Movie) RETURN movie.title

// -*-  Related nodes
//Return all the movies directed by "Oliver" / "Rob"
	MATCH (director {name: "Oliver Stone"})--(movie)
	RETURN movie.title

//// Match with labels
// -*-  Relationship basics
//Return any nodes connected with the Person Oliver by an Outgoing relationship

MATCH (director {name: "Oliver Stone"})-->(movie)
RETURN movie.title

//Return any nodes connected with the Person Charlie Sheen by an Outgoing relationship
MATCH (director {name: "Charlie Sheen"})-->(movie)
RETURN *

// -*-  Outgoing relationships


// -*-  Directed relationships and variable
//Return the type of each [outgoing] relationship
MATCH (:Person {name: "Oliver Stone"})-[r]->(movie)
RETURN type(r)

// -*-  Match on relationship type
// return all actors acted in a movie

MATCH (ws:Movie {title: "Wall Street"})<-[:ACTED_IN]-(actor)
RETURN actor.name


// -*-  Match on multiple relationship types
//RETURN nodes with ACTED_IN or DIRECTED relationship to a movie
MATCH (ws:Movie {title: "Wall Street"})<-[:ACTED_IN|:DIRECTED]-(person)
RETURN person.name


// -*-  Match on relationship type and use a variable
MATCH (ws:Movie {title: "Wall Street"})<-[r:ACTED_IN]-(person)
RETURN r.role

//Relationships 
// -*-  Relationship types with uncommon characters
MATCH
(charlie:Person {name: "Charlie Sheen"}),
(rob:Person {name: "Rob Reiner"})
CREATE (rob)-[:`TYPE INCLUDING A SPACE`]->(charlie)

MATCH
    (rob{name: "Rob Reiner"})-[r:`TYPE INCLUDING A SPACE`]->()
RETURN 
    type(r)

//-*-  Multiple relationships
// ()--()
// ()<-->()
// ()-->()
// ()<--()
// Return the movie charlie Sheen acted in and its director
MATCH (charlie {name: "Charlie Sheen"})-[:ACTED_IN]->(movie)<-[:DIRECTED]-(director)
RETURN movie.title, director.name


//-*-  Variable length relationships
// Nodes that are a variable number of 
// relationship->node hops away can be found
// using the following syntax: 
// -[:TYPE*minHops..maxHops]->. 
// minHops and maxHops are optional 
// and default to 1 and infinity respectively. 
// When no bounds are given the dots may be omitted. 
// The dots may also be omitted when setting only one bound 
// and this implies a fixed length pattern.

//Returns all movies related to 'Charlie Sheen' by 1 to 3 hops. 
MATCH (charlie {name: "Charlie Sheen"})-[:ACTED_IN*1..3]-(movie:Movie)
RETURN movie.title


// -*-  Variable length relationships with multiple relationship types

//Return all people related to Charlie Sheen, by 2 hops , with any combination of relationship

MATCH (charlie {name: "Charlie Sheen"})-[:ACTED_IN|DIRECTED*2]-(person:Person)
RETURN person.name

// -*-  Relationship variable in variable length relationships

//Return a list of relationships

MATCH p=(actor{name: "Charlie Sheen"})-(:ACTED_IN*2)-(co_actor)
RETURN p

MATCH p=(actor{name: "Charlie Sheen"})-(:ACTED_IN*2)-(co_actor)
RETURN relationships(p)

// -*-  Match with properties on a variable length path

MATCH
  (charlie:Person {name: 'Charlie Sheen'}),
  (martin:Person {name: 'Martin Sheen'})
CREATE (charlie)-[:X {blocked: false}]->(:UNBLOCKED)<-[:X {blocked: false}]-(martin)
CREATE (charlie)-[:X {blocked: true}]->(:BLOCKED)<-[:X {blocked: false}]-(martin)


// Return the path between charlie Sheen and martin Sheen 
// where all the relationship blocked prop set to false
MATCH p=(charlie:Person)-[* {blocked: false}]-(martin:Person)
WHERE charlie.name = "Charlie Sheen" AND martin.name = "Martin Sheen"
RETURN p

// -*-  Zero length paths
Return the movie itself as well as actors and director one relationship way

MATCH (ws:Movie {title: "Wall Street"})-[*0..1]-(x)
return x

// -*-  Named paths
// Return the two paths from Micheal Douglas
   
   MATCH p = (m {name: "Micheal Douglas"})-->()
   RETURN p

// -*-  Matching on a bound relationship

MATCH (a)-[r]-(b)
WHERE id(r) = 0
RETURN a, b

//// Shortest path 

MATCH
    (martin:Person {name: "Martin Sheen"}),
    (oliver:Person {name: "Oliver Stone"}),
    p= shortestPath((martin)-[*..15]-(oliver))
RETURN p


//Single shortest path with predicates
//predicates always use with where clause
//TBD
// MATCH
//     (charlie:Person {name: 'Charlie Sheen'}),
//     (martin:Person {name: "Martin Sheen"}),
//     p= shortestPath((charlie)-[*]-(martin))
// WHERE none(r in relationship(p) WHERE type(r) = 'FATHER')
// RETURN p

// All the shortest paths
MATCH
    (martin:Person {name: "Martin Sheen"}),
    (micheal:Person {name: "Micheal Douglas"}),
    p= allShortestPaths((martin)-[*]-(micheal))
RETURN p

// Node By id
MATCH (n)
WHERE id(n) = 0
RETURN n

// Relationship by id

MATCH ()-[r]->()
WHERE id(r) = 0
RETURN r

// Multiple nodes by id

MATCH (n)
WHERE id(n) IN [0, 3, 5]
RETURN n
