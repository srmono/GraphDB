from neo4j import GraphDatabase

# uri = "neo4j://localhost:7687"

# connect = GraphDatabase.driver(uri, auth=("neo4j","mypass123$"))

class HelloWorldExample:

    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def print_greeting(self, message):
        with self.driver.session() as session:
            greeting = session.write_transaction(self._create_and_return_greeting, message)
            print(greeting)

    @staticmethod
    def _create_and_return_greeting(tx, message):
        result = tx.run("CREATE (a:Greeting) "
                        "SET a.message = $message "
                        "RETURN a.message + ', from node ' + id(a)", message=message)
        return result.single()[0]


if __name__ == "__main__":
    greeter = HelloWorldExample("bolt://localhost:7687", "neo4j", "mypass123$")
    greeter.print_greeting("hello, world")
    greeter.close()
    

# from neo4j import GraphDatabase
# uri = "neo4j://localhost:7687"

# connect = GraphDatabase.driver(uri, auth=("neo4j","mypass123$"))

# session = connect.session()

# query = "match (n) return n limit 10"

# matchall = session.run(query)
# for i in matchall:
#     print(i)

