
// return [1,2,3,4,5,5]
// return range (0,10), [a IN range(0,10) | a*2] AS list
// return [a IN range(0,10) WHERE a % 2 = 0][-2] AS list
// return [a IN range(0,10) WHERE a % 2 = 0] AS list
// return [a IN range(0,10) WHERE a % 2 = 0]
// return [a IN range(0,10)]
// return range(-5,10)[-5] AS range
// return range(-5,10) AS range
// return range(0,10) AS range
// return range(0,10)
// return [1,2,3,4,5,9,45,67,89][null]
// return [1,2,3,4,5,9,45,67,89][..-2]
// return [1,2,3,4,5,9,45,67,89][-2..]
// return [1,2,3,4,5,9,45,67,89][4..]
// return [1,2,3,4,5,9,45,67,89][..5]
// return [1,2,3,4,5,9,45,67,89][3..5]
// return [1,2,3,4,5,9,45,67,89][-2]
// return [1,2,3,4,5][2]
// return [0.6,8.9,-1,-2,-3,null,-4,-5,9,10,23] as `List of values`
// return [0.6,8.9,-1,-2,-3,-4,-5,9,10,23] as `List of values`
// return [0.6,8.9,-1,-2,-3,-4,-5,9,10,23] as List of values
// return [0.6,8.9,-1,-2,-3,-4,-5,9,10,23] as List
// return [0.6,8.9,-1,-2,-3,-4,-5,9,10,23]
// return [-1,-2,-3,-4,-5,9,10,23]
// return [-1,-2,-3,-4,-5]
// return [1,2,3,4,5,5]
// return null IN [2,3,4,5,null,90,6,7,7]
// return null IN [null]
// ALTER USER neo4j SET PASSWORD 'mypass123$'
// :server change-password


MATCH (a:Person {name: "Hugo Weaving"})
RETURN [(a)-->(b) WHERE b:Movie | b.title ] AS `venkat connected to these movies`

MATCH 
    (a:Person {name: "Hugo Weaving"})
RETURN 
    [(a)-->(b) WHERE b:Movie | b.title ] AS `venkat connected to these movies`, 
    [(a)-->(b) WHERE b:Movie | b.released] AS `release date`

MATCH (m:Movie {title: "The Green Mile"})
RETURN [(n)-[:ACTED_IN]->(m) | n.name] AS `Actors in The Green Mile`
