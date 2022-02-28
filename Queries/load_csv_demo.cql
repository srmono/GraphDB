//Refer employee.csv and department.csv 

// When deriving a graph model from a relational model, you should keep a couple of general guidelines in mind.
// -- A row is a node.
// -- A table name is a label name.
// -- A join or foreign key is a relationship.

//Example 1 - file directly placed in import directory (import/data.csv)
LOAD CSV FROM "file:///data.csv"

//Example 2 - file placed in subdirectory within import directory (import/directory/customers.csv)
LOAD CSV FROM "file:///directory/customers.csv"

//Example 3 - file from website
LOAD CSV FROM 'https://data.domain.com/directory/customers.csv'

//Example 4 - Google
LOAD CSV WITH HEADERS FROM 'https://docs.google.com/spreadsheets/d/<yourFilePath>/export?format=csv'


//**Important Tips for LOAD CSV
// There are a few things to keep in mind with LOAD CSV and a few helpful tips for handling the variety of data scenarios you are likely to encounter.
// -- All data from the CSV file is read as a string, so you need to use toInteger(), toFloat(), split() or similar functions to convert values.
// -- Check your Cypher import statement for typos. Labels, property names, relationship-types, and variables are case-sensitive.
// -- The cleaner the data, the easier the load. Try to handle complex cleanup/manipulation before load.

create database csvtest
:use csvtest
LOAD CSV FROM "file:///employee.csv" AS column return column
match (n) return n
match (n) detach delete n
LOAD CSV FROM "file:///employee.csv" AS column create (:Employee)
MATCH (n:Employee) RETURN n LIMIT 25
match (n) return n

//Importing from server
LOAD CSV FROM "https://data.neo4j.com/northwind/products.csv" as file return linenumber(), file
LOAD CSV FROM "https://data.neo4j.com/northwind/products.csv" as file return file


// Other Examples 
companies.csv
Id,Name,Location,Email,BusinessType
1,Neo4j,San Mateo,contact@neo4j.com,P
2,AAA,,info@aaa.com,
3,BBB,Chicago,,G


employees.csv
Id,Name,Skills,Email
1,Joe Smith,Cypher:Java:JavaScript,joe@neo4j.com
2,Mary Jones,Java,mary@neo4j.com
3,Trevor Scott,Java:JavaScript,trevor@neo4j.com


people.csv
employeeId,Name,Company
1,Bob Smith,1
2,Joe Jones,3
3,Susan Scott,2
4,Karen White,1

