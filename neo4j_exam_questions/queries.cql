1. Property Types
Question:
What are the property types in Neo4j?

Answer:
1. Number, an abstract type, which has the subtypes Integer and Float
2. String
3. Boolean
4. The spatial type Point
5. Temporal types: Date, Time, LocalTime, DateTime, LocalDateTime and Duration

--------
2. Structural Types
Question:
What are the structural types in Neo4j?

Answer:

1. Nodes. This comprises: Id, Label(s) and Map (of properties)
2. Relationships. This comprises: Id, Type, Map (of properties) and Id of the start and end nodes
3. Paths. This is alternating sequence of nodes and relationships

--------
3. NAMING RULES
Question:

In Neo4j, names are case sensitive? True or False

Answer:

True

Example:

:CUSTOMER, :Customer and :customer are three different labels
m and M are two different variables.
n.name and n.NAME are two different properties
u.Name, u.nAME, u.NamE and u.name are four different properties

-------------
NAMING RULES (Alphabetic characters)
Question:

Names should begin with an alphabetic character including "non-English" characters, such as å, ä, ö, ü.

True or False?

Answer:

True

------------

NAMING RULES (Numbers)
Question:
Names can begin with a number.
True or False?

Answer
False

Example:
Wrong: 4Person, 2_User, 20Moive, 3person, 8customer
Right: Person, User, Movie, person, customer

------------

NAMING RULES (Symbols)
Question:

Names should not contain symbols, except for underscore and $ (for parameter).
True or False?

Answer:
True

Example:

Wrong: #user, person@, !employee
Right: friend_of_friend, customer_comment
Right: $param, $params, $actorName, $customerDetails
-------------

7. NAMING RULES (Length)
Question:
How long can a naming rule be?

Answer:
Can be as long as 65534 characters (depends on the version of Neo4j).

----------

8. NAMING RULES (Whitespace characters)
Question:

In Neo4j leading and trailing whitespace characters will not be removed automatically.

True or False?

Answer:

False.
Leading and trailing whitespace characters are removed automatically

----------
9. NAMING RULE EXCEPTIONS
Question:

Under what condition can Non-alphabetic characters, including numbers, symbols and whitespace characters, can be used in names?

Answer:

It is possible with backticks. Backticks will help to escape them.

Example:
` My users`, `1stCustomer`, `$$buyer`, and `Friend of Friend`.name,

---------------
10. SCOPING and NAMESPACE RULES
Question:

Take a look at this cypher:

CREATE (venkat:venkat {venkat: 'venkat'})-[r:venkat]->(secondvenkat:venkat {venkat: 'venkat'})

Is this possible?

If yes or no, explain.


Answer:

Yes. Although it looks wild, if there is any need to do the above, there is nothing wrong with it as the first node is different from the last node because they have different variables. It simply mean two different people called 'venkat'. For whatever reason "love loves love" or "slap slaps slap" it is the same reason 'venkat venkat venkat' as it is not about English test but about cypher test :).

In summary, Node labels, relationship types and property names may re-use names.

---------
11. SCOPING and NAMESPACE RULES
Question:

Take a look at this cypher

CREATE (jane:jane {jane: 'jane'})-[jane:janes]->(secondJane:jane {jane: 'jane'})

Is this possible?
If yes or no, explain.

Answer

No. Variables for nodes and relationships must not re-use names within the same query scope.

----------

12. CLAUSES ( Reserved keywords)
Question:

What are the Neo4j clauses?



Answer:

CALL

CREATE

DELETE

DETACH

EXISTS

FOREACH

LOAD

MATCH

MERGE

OPTIONAL

REMOVE

RETURN

SET

START

UNION

UNWIND

WITH

--------------------

13.SUBCLAUSES ( Reserved keywords)
Question:

What are the Neo4j subclauses?

Answer:

LIMIT

ORDER

SKIP

WHERE

YIELD

-------------

14. MODIFIERS ( Reserved keywords)
Question:

What are the Neo4j Modifiers?

Answer:
ASC
ASCENDING
ASSERT
BY
CSV
DESC
DESCENDING
ON

-----------------------------

15. EXPRESSIONS ( Reserved keywords)
Question:

What are the Neo4j Expressions?


Answer:

ALL

CASE

ELSE

END

THEN

WHEN

------------------

16. OPERATORS ( Reserved keywords)
Question:

What are the Neo4j Operators?

Answer:

AND
AS
CONTAINS
DISTINCT
ENDS
IN
IS
NOT
OR
STARTS
XOR

----------------

17. SCHEMA ( Reserved keywords)
Question:

What are the Neo4j Schema?

Answer:

CONSTRAINT

CREATE

DROP

EXISTS

INDEX

NODE

KEY

UNIQUE

----------

18. HINTS ( Reserved keywords)
Question:

What are the Neo4j Hints?

Answer:

INDEX

JOIN

PERIODIC

COMMIT

SCAN

USING

---------------------

19. LITERALS (Reserved keywords)
Question:

What are the Neo4j Literals?

Answer:

false

null

true

-----------------------
















