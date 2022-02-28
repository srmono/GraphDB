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
LOAD CSV FROM "file:///employee.csv" AS row create (:Employee)
MATCH (n:Employee) RETURN n LIMIT 25
match (n) return n

//Importing from server
LOAD CSV FROM "https://data.neo4j.com/northwind/products.csv" as file return linenumber(), file
LOAD CSV FROM "https://data.neo4j.com/northwind/products.csv" as file return file


LOAD CSV WITH HEADERS FROM "file:///employee.csv" AS column 
create (n:Employee)
set n=column
return n

LOAD CSV WITH HEADERS FROM "file:///employee.csv" AS column 
create (n:Employee)
set n=column
return n.EMPLOYEE_ID, n.FIRST_NAME, n.LAST_NAME, n.PHONE_NUMBER, n.SALARY, n.DEPARTMENT_ID

LOAD CSV WITH HEADERS FROM "file:///employee.csv" AS column 
create (n:Employee)
set n=column,
n.EMPLOYEE_ID = toInteger(column.EMPLOYEE_ID),
n.SALARY = toFloat(column.SALARY),
n.DEPARTMENT_ID = toInteger(column.DEPARTMENT_ID)
return n

//Custom / Manually creating properties
LOAD CSV FROM "file:///employee.csv" AS column 
CREATE (n:Employee{
    EMPLOYEE_ID:column[0],
    FIRST_NAME:column[1],
    LAST_NAME:column[2],
    EMAIL:column[3],
    PHONE_NUMBER:column[4],
    SALARY:column[5],
    DEPARTMENT_ID:column[6]
    })
set
n.EMPLOYEE_ID = toInteger(n.EMPLOYEE_ID),
n.SALARY = toFloat(n.SALARY),
n.DEPARTMENT_ID = toInteger(n.DEPARTMENT_ID)
RETURN n

// Multiple csv file import with relationships
// Airlines, Airports, Flights
// datasets_810_1496_airlines.csv
// datasets_810_1496_airports.csv
// flights.csv

// airlines
// airports
// flights 

LOAD CSV WITH HEADERS FROM "file:///datasets_810_1496_airlines.csv" AS airlines
CREATE (
    al:Airlines{
        IATA_CODE:airlines.IATA_CODE, 
        AIRLINE:airlines.AIRLINE
        }
    )
WITH al 
LOAD CSV WITH HEADERS FROM "file:///datasets_810_1496_airports.csv" AS airports
CREATE (
    a:Airports{
        IATA_CODE:airports.IATA_CODE, 
        AIRPORT: airports.AIRPORT,
        CITY: airports.CITY,
        STATE: airports.STATE,
        COUNTRY: airports.COUNTRY,
        LATITUDE: airports.LATITUDE,
        LONGITUDE: airports.LONGITUDE
        }
    )
WITH a, al 
LOAD CSV WITH HEADERS FROM "file:///flights.csv" AS flights
CREATE (
    f:Flights{
        YEAR: flights.YEAR,
        MONTH: flights.MONTH,
        DAY: flights.DAY,
        DAY_OF_WEEK: flights.DAY_OF_WEEK,
        AIRLINE: flights.AIRLINE,
        FLIGHT_NUMBER: flights.FLIGHT_NUMBER,
        TAIL_NUMBER: flights.TAIL_NUMBER,
        ORIGIN_AIRPORT: flights.ORIGIN_AIRPORT,
        DESTINATION_AIRPORT: flights.DESTINATION_AIRPORT,
        SCHEDULED_DEPARTURE: flights.SCHEDULED_DEPARTURE,
        DEPARTURE_TIME: flights.DEPARTURE_TIME,
        DEPARTURE_DELAY: flights.DEPARTURE_DELAY,
        TAXI_OUT: flights.TAXI_OUT,
        WHEELS_OFF: flights.WHEELS_OFF,
        SCHEDULED_TIME: flights.SCHEDULED_TIME,
        ELAPSED_TIME:flights.ELAPSED_TIME,
        AIR_TIME: flights.AIR_TIME,
        DISTANCE: flights.DISTANCE,
        WHEELS_ON: flights.WHEELS_ON,
        TAXI_IN: flights.TAXI_IN,
        SCHEDULED_ARRIVAL: flights.SCHEDULED_ARRIVAL,
        ARRIVAL_TIME: flights.ARRIVAL_TIME,
        ARRIVAL_DELAY: flights.ARRIVAL_DELAY,
        DIVERTED: flights.DIVERTED,
        CANCELLED: flights.CANCELLED,
        CANCELLATION_REASON: flights.CANCELLATION_REASON,
        AIR_SYSTEM_DELAY: flights.AIR_SYSTEM_DELAY,
        SECURITY_DELAY: flights.SECURITY_DELAY,
        AIRLINE_DELAY: flights.AIRLINE_DELAY,
        LATE_AIRCRAFT_DELAY: flights.LATE_AIRCRAFT_DELAY,
        WEATHER_DELAY: flights.WEATHER_DELAY
    }
    )
WITH a, f, al
MATCH
    (a:Airports{IATA_CODE: a.IATA_CODE}),
    (f:Flights{DESTINATION_AIRPORT: f.DESTINATION_AIRPORT}),
    (al:Airlines{IATA_CODE: al.IATA_CODE})
WHERE a.IATA_CODE = f.DESTINATION_AIRPORT AND al.IATA_CODE = f.AIRLINE
CREATE (al)<-[:OWN_BY]-(f)-[:FLY_TO]->(a)
RETURN *









































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

