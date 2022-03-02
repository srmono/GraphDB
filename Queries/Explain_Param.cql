//Explain 
MATCH (n:Person)-[:REVIEW]->(m:Movie)
RETURN n.person

//Param 
MATCH (p:Person)-[:PRODUCED]->(m:Movie)
WHERE p.name = "Joel Silver"
RETURN m.released, m.title ORDER BY m.released DESC

//Create parameter
:param producerName => "Joel Silver"
//List all params
:params
:history
:help param
:params
:params {name1: "Stefan Arnd", name2: "Joel Silver", name3:"Nora Ephron"}


MATCH (p:Person)-[:PRODUCED]->(m:Movie)
WHERE p.name = $producerName
RETURN m.released, m.title ORDER BY m.released DESC
