// Refer graph (where_clause.png)

//Refer Java Regular Expressions
//https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/util/regex/Pattern.html

CREATE
    (a:Person:Swedish{ name:"Andy", age:36, belt:"white"}),
    (b:Person {name:"Peter", email:"peter_n@example.com", age:35}),
    (c:Person {name:"Timothy", address:"Sweden/Malmo", age:25}),
    (d:Dog {name:"Andy"}),
    (e:Dog {name:"Fido"}),
    (f:Dog {name:"Ozzy"}),
    (t:Toy {name:"Banana"}),
    (a)-[:HAS_DOG {since:2016}]->(d),
    (a)-[:KNOWS {since:1999}]->(b),
    (a)-[:KNOWS {since:2012}]->(c),
    (b)-[:HAS_DOG {since:2010}]->(e),
    (b)-[:HAS_DOG {since:2018}]->(f),
    (e)-[:HAS_TOY]->(t)
RETURN *

//Basic Use with Boolean operator
//AND, OR, XOR, NOT 
MATCH (n:Person)
WHERE n.name = "Perter" XOR (n.age < 30 AND n.name = 'Timothy') OR NOT (n.name = 'Timothy' OR n.name = "Peter")
RETURN 
    n.name AS name,
    n.age AS age 
ORDER BY name 

// Filter on Node Label
MATCH (n) 
WHERE n:Swedish
RETURN n.name, n.age 

// Filter on Node property
MATCH (n:Person) 
WHERE n.age < 30
RETURN n.name, n.age 

// Filter on Relationship property
MATCH (n:Person)-[k:KNOWS]->(f)
WHERE k.since < 2000
RETURN f.name, f.age, f.email

// Filter on dynamically-computed node property
WITH 'AGE' as propname
MATCH (n:Person)
WHERE n[toLower(propname)] < 30
RETURN n.name, n.age

//Property existence checking
//IS NOT NULL 
MATCH (n:Person)
WHERE n.belt IS NOT NULL
RETURN n.name, n.belt

//String Matching
//prefix and suffix with STARTS WITH , ENDS WITH 

MATCH (n:Person)
WHERE n.name STARTS WITH 'Pet'
RETURN n.name, n.age


MATCH (n:Person)
WHERE n.name ENDS WITH 'ter'
RETURN n.name, n.age

// Substring  CONTAINS
MATCH (n:Person)
WHERE n.name CONTAINS 'ete'
RETURN n.name, n.age

// String matching negation 
// Use the NOT keyword to exclude all matched on given string from your results
MATCH (n:Person)
WHERE NOT n.name ENDS WITH 'y'
RETURN n.name, n.age

// Regular Expressions
 //=~ 'regexp'
//  case insensitive (?i)
//  multiline (?m)

MATCH (n:Person)
WHERE n.name =~ 'Tim.*'
RETURN n.name, n.age


//Escaping in regular expression
MATCH (n:Person)
WHERE n.email =~ '.*\\.com'
RETURN n.name, n.age

//Case Insensitive 
MATCH (n:Person)
WHERE n.name =~ '(?i)AND.*'
RETURN n.name, n.age

//Using Path pattern in WHERE

//Filter on patterns
MATCH 
    (timothy:Person {name: 'Timothy'}),
    (other:Person)
WHERE other.name IN ['Andy', 'Peter'] AND (other)-->(timothy)
RETURN other.name, other.age 

//Filter on patterns using NOT
MATCH 
    (person:Person),
    (peter:Person {name: 'Peter'})
WHERE NOT (person)-->(peter)
RETURN person.name, person.age 

//Filter on patterns with properties
MATCH (n:Person)
WHERE (n)-[:KNOWS]->({name: 'Timothy'})
RETURN n.name, n.age


//Filter on relationship type
MATCH (n:Person)-[r]->()
WHERE n.name='Andy' AND type(r) =~ 'K.*'
RETURN type(r), r.since

// Using Existential Subqueries in WHERE

// EXISTS {
//     MATCH [Patter]
//     WHERE [Expression]
// }

MATCH (person:Person)
WHERE EXISTS {
    MATCH (person)-[:HAS_DOG]->(:Dog)
}
RETURN person.name AS name

MATCH (person:Person)
WHERE EXISTS {
    MATCH (person)-[:HAS_DOG]->(dog:Dog)
    WHERE person.name = dog.name
}
RETURN person.name AS name

//Nesting Existential subqueries
