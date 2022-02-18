// Refer With Graph (image)
//Using WITH, you can manipulate the output before it is passed on to the following query parts. Manipulations can be done to the shape and/or number of entries in the result set.
//One common usage of WITH is to limit the number of entries passed on to other MATCH clauses. By combining ORDER BY and LIMIT, it is possible to get the top X entries by some criteria and then bring in additional data from the graph.
//WITH can also be used to introduce new variables containing the results of expressions for use in the following query parts
// variables for expressions
// Using the wildcard to carry over variables
// Filter on aggregate function results
// Sort results before using collect on them
// Limit branching of a path search
CREATE
    (a{name:"Anders"}),
    (b{name:"Caesar"}),
    (c{name:"Bossman"}),
    (d{name:"George"}),
    (e{name:"David"}),
    (a)-[:BLOCKS]->(b),
    (a)-[:KNOWS]->(c),
    (b)-[:KNOWS]->(d),
    (c)-[:KNOWS]->(d),
    (c)-[:BLOCKS]->(e),
    (e)-[:KNOWS]->(a),
RETURN *

//Returns the name of persons connected to "George" whose name start with C

MATCH (george {name: "George"})<--(otherperson)
WITH otherperson, toUpper(otherperson.name) AS upperCaseName
WHERE upperCaseName STARTS WITH 'C'
RETURN otherperson.name


//use the wildcard "*" to carry over all variable that are in scope, 
// in addition to introduce the new variable

//return the name of all related persons and the type of relationship between them
MATCH (person)-[r]->(otherperson)
WITH *, type(r) AS connectedType
RETURN person.name, otherperson.name, connectedType

// Filter on Aggregate function results
// The name of the person connected to 'David'  with the at least more than 
// one outgoing relations 

MATCH (david {name: "David"})--(otherPerson)-->()
WITH otherPerson, count(*) AS numRel
WHERE numRel > 1
RETURN otherPerson.name

// Sort results before using collect on them 
// A list of the name of people in reverse order, limit to 3, is retured in a list type [name,name2]

MATCH (n)
WITH n
ORDER BY n.name DESC
LIMIT 3
RETURN collect(n.name)

// Limit branching of a path search
// Starting with Anders, 
//     find all matching nodes , 
//     order by name desc order 
//     get the top result
//     then find all the ndoes connected to that top result 
//     return their names

MATCH (n {name: "Anders"})--(m)
WITH m 
ORDER BY m.name DESC
LIMIT 1
MATCH (m)--(o)
RETURN o.name