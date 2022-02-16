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

MATCH (charlie {name: "Charlie Sheen"})-[:ACTED_IN*1..3]-(movie:Movie)
RETURN movie.title




// -*-  Variable length relationships with multiple relationship types
// -*-  Relationship variable in variable length relationships
// -*-  Match with properties on a variable length path
// -*-  Zero length paths
// -*-  Named paths
// -*-  Matching on a bound relationship