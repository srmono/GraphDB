// //APOC : Awesome Procedures on Cypher
// functionality
// utilities 
// conversions 
// graph update many more 

 
    
// Aproach 1
CALL apoc.import.csv([{fileName: 'file:///apocnodes.csv', labels:['Company']}], [], {})

//Aproach 2: employees.csv 
CALL apoc.load.csv('http://data.neo4j.com/northwind/products.csv') YIELD lineNo, map, list
 RETURN *

 CALL apoc.load.csv('employees.csv') YIELD lineNo, map, list
 RETURN *


//Import JSON
CALL apoc.load.json("file:///person.json")
YIELD value
RETURN value

CALL apoc.load.json("file:///person.json")
YIELD value
MERGE (p:Person {name: value.name})
SET p.age = value.age 
WITH value, p
UNWIND value.children AS child
MERGE (c:Person {name: child})
MERGE (c)-[:CHILD_OF]->(p)
RETURN *

//load schools.json 

CALL apoc.load.json("file:///schools.json")
YIELD value
MERGE (s:School {name: value.school})
SET s.address = value.address 
WITH s, value 
UNWIND value.students AS student 
MERGE (c:Student {name: student})
MERGE (c)-[:STUDENT_OF]->(s)
RETURN *

//update with continent
CALL apoc.load.json("file:///schools.json")
YIELD value
MERGE (s:School {name: value.school})
SET s.address = value.address 
WITH s, value 
UNWIND value.students AS student 
MERGE (c:Student {name: student})
MERGE (c)-[:STUDENT_OF]->(s)
MERGE (i:Continent {name: "India" })
MERGE (s)-[:LOCATED_IN]->(i)
RETURN *

// Import companyAssignment.json

{
 "companyName":"Boss Inc",
 "address": "23, New Road, Off Camp, Ademola, Lagos, Nigeria",
 "employees": ["Victor Sada","Mike Reo","Elizabeth Kane", "Happy Stone", "Grace Baba", "Tony Campo", "Zain Rono", "Paul Tanson"],
 "customers":["Pace Fadi", "Gado Belli", "Luck Best"]
}

CALL apoc.load.json("file:///companyAssignment.json")
YIELD value
MERGE (c:Company {name: value.companyName})
SET c.address = value.address
WITH c, value
UNWIND value.employees AS employee
UNWIND value.customers AS customer
MERGE (e:Employee {name: employee})
MERGE (e)-[:IS_EMPLOYEE_OF]->(c)
MERGE (cust:Customer {name: customer})
MERGE (cust)-[:CUSTOMER_OF]->(c)
MERGE (r:Regulatory {name: "Corporation Affair Commission"})
MERGE (c)-[:REGISTERED_WITH]->(r)
RETURN *
