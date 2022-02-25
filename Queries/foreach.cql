// Refer Foreach Graph

//Description:
//The FOREACH clause can be used to update data, such as executing update commands on elements in a path, or on a list created by aggregation.
//The variable context within the FOREACH parenthesis is separate from the one outside it. This means that if you CREATE a node variable within a FOREACH, you will not be able to use it outside of the foreach statement, unless you match to find it.
//Within the FOREACH parentheses, you can do any of the updating commands — 
//SET, REMOVE, CREATE, MERGE, DELETE, and FOREACH.

CREATE
    (a:Person {name:"A"}),
    (b:Person {name:"B"}),
    (c:Person {name:"C"}),
    (d:Person {name:"D"}),
    (a)-[:KNOWS]->(b),
    (b)-[:KNOWS]->(c),
    (c)-[:KNOWS]->(d)
RETURN *


//Mark all nodes along a path
//This query will set the property marked to true on all nodes along a path.

MATCH p=(start)-[*]->(finish)
WHERE start.name = 'A' AND finish.name = 'D'
FOREACH (n IN nodes(p) | SET n.marked = true)