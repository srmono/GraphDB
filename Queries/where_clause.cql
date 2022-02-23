// Refer graph (Where_clause.png )

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