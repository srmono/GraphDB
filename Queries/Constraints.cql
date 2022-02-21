// Unique node property Constraints
// -- Unique property constraints ensure that property values are unique for all nodes with a specific label. For unique property constraints on multiple properties, the combination of the property values is unique. Unique constraints do not require all nodes to have a unique value for the properties listed — nodes without all properties are not subject to this rule.

// Node property Existence Constraints [Enterprise]
// -- Node property existence constraints ensure that a property exists for all nodes with a specific label. Queries that try to create new nodes of the specified label, but without this property, will fail. The same is true for queries that try to remove the mandatory property.

// Relationship Property Existence Constraints [Enterprise]
// -- Property existence constraints ensure that a property exists for all relationships with a specific type. All queries that try to create relationships of the specified type, but without this property, will fail. The same is true for queries that try to remove the mandatory property.

// Node key Constraints [Enterprise]
// -- Node key constraints ensure that, for a given label and set of properties:
//     All the properties exist on all the nodes with that label.
//     The combination of the property values is unique.
// -- Queries attempting to do any of the following will fail:
//     Create new nodes without all the properties or where the combination of property values is not unique.
//     Remove one of the mandatory properties.

Update the properties so that the combination of property values is no longer unique.

CREATE CONSTRAINT email_constraint 
ON (n:Person) ASSERT n.email IS UNIQUE 

// CREATE CONSTRAINT ON (n:Person) ASSERT EXISTS (n.email)

CREATE (n:Person {name: "Venkat", phone:"9035351965", email: "bvsrao91@gmail.com"})


CREATE CONSTRAINT exist_constraint 
ON (n:Developer) ASSERT EXISTS (n.qualification)

CREATE (n:Developer {name: "Greeshma", phone:"67768686"})

//Enforcing proeprty existence on Relationship

CREATE CONSTRAINT constraint_relationship 
ON ()-[r:ORDERED]->() ASSERT EXISTS (r.discount)

CREATE (n:Customer)-[o:ORDERED]->(m:Mobile)

CREATE (n:Customer)-[o:ORDERED {discount:"50%"}]->(m:Mobile)

// Node Key Constraints
CREATE CONSTRAINT constraint_sets 
ON (n:Product)  ASSERT (n.name, n.price) IS NODE KEY

//New syntax 
CREATE CONSTRAINT constraint_name FOR (n:Product) REQUIRE (n.name, n.price) IS NODE KEY

CREATE (p:Product {name: "IPhone", discount: "5%"})


//-------------------------------------------------------------------------

//Create a unique node property constraint
//This command creates a uniqueness constraint on nodes with the specified label and properties.
CREATE CONSTRAINT [constraint_name] [IF NOT EXISTS]
FOR (n:LabelName)
REQUIRE n.propertyName IS UNIQUE
[OPTIONS "{" option: value[, ...] "}"]

//Index provider and configuration can be specified using the OPTIONS clause.
CREATE CONSTRAINT [constraint_name] [IF NOT EXISTS]
FOR (n:LabelName)
REQUIRE (n.propertyName_1, …, n.propertyName_n) IS UNIQUE
[OPTIONS "{" option: value[, ...] "}"]

//Create a node property existence constraint:
//This command creates a property existence constraint on nodes with the specified label and property.
CREATE CONSTRAINT [constraint_name] [IF NOT EXISTS]
FOR (n:LabelName)
REQUIRE n.propertyName IS NOT NULL
[OPTIONS "{" "}"]

//Create a relationship property existence constrain:
//This command creates a property existence constraint on relationships with the specified relationship type and property
CREATE CONSTRAINT [constraint_name] [IF NOT EXISTS]
FOR ()-"["r:RELATIONSHIP_TYPE"]"-()
REQUIRE r.propertyName IS NOT NULL
[OPTIONS "{" "}"]

//Create a node key constraint
//This command creates a node key constraint on nodes with the specified label and properties
CREATE CONSTRAINT [constraint_name] [IF NOT EXISTS]
FOR (n:LabelName)
REQUIRE n.propertyName IS NODE KEY
[OPTIONS "{" option: value[, ...] "}"]

//Index provider and configuration can be specified using the OPTIONS clause.
CREATE CONSTRAINT [constraint_name] [IF NOT EXISTS]
FOR (n:LabelName)
REQUIRE (n.propertyName_1, …, n.propertyName_n) IS NODE KEY
[OPTIONS "{" option: value[, ...] "}"]

//-- Note: Dropping a constraint requires the DROP CONSTRAINT privilege.
// Drop a constraint
DROP CONSTRAINT constraint_name [IF EXISTS]

//List Constraints
    SHOW ALL CONSTRAINTS  or CALL DB.CONSTRAINTS

//SYNTAX
SHOW [ALL|UNIQUE|NODE [PROPERTY] EXIST[ENCE]|REL[ATIONSHIP] [PROPERTY] EXIST[ENCE]|[PROPERTY] EXIST[ENCE]|NODE KEY] CONSTRAINT[S]
    [WHERE expression]

//Note:- Refer list_constraints.png to check list constraints output

//--------------------------------------------------------------------------
// Few More Examples:-

//Unique node property constraints
CREATE CONSTRAINT constraint_name FOR (book:Book) REQUIRE book.isbn IS UNIQUE

// Create a unique constraint only if it does not already exist
CREATE CONSTRAINT constraint_name IF NOT EXISTS FOR (book:Book) REQUIRE book.isbn IS UNIQUE

//Create a unique constraint with specified index provider and configuration
CREATE CONSTRAINT constraint_with_options FOR (n:Label) REQUIRE (n.prop1, n.prop2) IS UNIQUE
OPTIONS {
 indexProvider: 'lucene+native-3.0',
 indexConfig: {`spatial.wgs-84.min`: [-100.0, -80.0], `spatial.wgs-84.max`: [100.0, 80.0]}
}

// Failure to create an already existing unique property constraint
CREATE CONSTRAINT FOR (book:Book) REQUIRE book.title IS UNIQUE
// error message:
// Constraint already exists: Constraint( id=4, name='preExistingUnique',
// type='UNIQUENESS', schema=(:Book {title}), ownedIndex=3 )

//Failure to create a unique property constraint on same schema as existing index
CREATE CONSTRAINT FOR (book:Book) REQUIRE book.wordCount IS UNIQUE

// error message:
// There already exists an index (:Book {wordCount}). A constraint cannot be created
// until the index has been dropped.

