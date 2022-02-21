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
    (e)-[:ACTED_IN]->(t),
RETURN *