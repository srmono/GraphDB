CREATE
    (a{name:"Alice", age: 38, eyes:"brown"}),
    (b{name:"Charlie", age: 53, eyes:"green"}),
    (c{name:"Bob", age: 25, eyes:"blue"}),
    (d{name:"Daniel", age: 54, eyes:"brown", liked_colors:[]}),
    (e{name:"Eskil", age: 41, eyes:"blue", liked_colors:["pink","yellow","black"]}),
    (a)-[:KNOWS]->(b),
    (a)-[:KNOWS]->(c),
    (b)-[:KNOWS]->(d),
    (c)-[:KNOWS]->(d),
    (c)-[:MARRIED]->(e)
RETURN *

CREATE
    (a{name:"Alice", age: 38, eyes:"brown"}),
    (b{name:"Charlie", age: 53, eyes:"green"}),
    (c{name:"Bob", age: 25, eyes:"blue"}),
    (d{name:"Daniel", age: 54, eyes:"brown", liked_colors:[]}),
    (e{name:"Eskil", age: 41, eyes:"blue", liked_colors:["pink","yellow","black"]}),
    (f{name:"Frank", age: 61, eyes:"", liked_colors:["bue","green"]}),
    (p:Person),
    (a)-[:KNOWS]->(b),
    (a)-[:KNOWS]->(c),
    (b)-[:KNOWS]->(d),
    (c)-[:KNOWS]->(d),
    (c)-[:MARRIED]->(e)
RETURN *

