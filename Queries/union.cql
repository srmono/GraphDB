//The UNION clause is used to combine the result of multiple queries.
//Refer union_clause graph

//Combine two queries and retain duplicates
MATCH (n:Actor)
RETURN n.name AS name
UNION ALL
MATCH (n:Movie)
RETURN n.title AS name

//Combine two queries and remove duplicates
MATCH (n:Actor)
RETURN n.name AS name
UNION
MATCH (n:Movie)
RETURN n.title AS name

