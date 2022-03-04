from neo4j import GraphDatabase
uri = "neo4j://localhost:7687"

connect = GraphDatabase.driver(uri, auth=("neo4j","mypass123$"))

session = connect.session()

query = "match (n) return n limit 10"

matchall = session.run(query)
for i in matchall:
    print(i)

