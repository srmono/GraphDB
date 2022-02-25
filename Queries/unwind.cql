// With UNWIND, you can transform any list back into individual rows. 
// These lists can be parameters that were passed in, or
// previously -ed result or other list expressions.
// One common usage of unwind is to create distinct lists. 
// Another is to create data from parameter lists that are provided to the query.
// UNWIND requires you to specify a new name for the inner values.

// Unwinding a list
UNWIND [1,2,3,null] AS x
RETURN x, 'val' AS y


//Create distinct list - TBD
// WITH [1,1,2,2] AS coll 
// UNWIND coll AS x
// WITH DISTINCT x
// RETURN collection(x) AS setOfVals

//  using UNWIND with any expression returning a list

WITH 
    [1,2] AS a 
    [3, 4] AS b
UNWIND (a + b) AS x
RETURN x

//Using UNWIND with list of lists
WITH [[1,2],[3,4],5] AS nested
UNWIND nested AS x 
UNWIND x AS y
RETURN y 

//Using UNWIND with empty list
UNWIND [] AS empty 
RETURN empty, `literal`


//replace empty values with null
WITH [] AS list 
UNWIND 
    CASE
        WHEN list = [] THEN [null]
        ELSE list
    END AS emptyList
RETURN emptyList

// Using UNWIND with an expression that is not in a list

UNWIND null AS x
RETURN x , 'some_text'


// Creating Nodes from list Parameter
// Parameter 
//events

//eventXYZ in 2010
{
    "events": [
        {
            "year": 2021,
            "id": 1
        },
        {
            "year": 2021,
            "id": 2
        }
    ]
}

UNWIND $events AS event
MERGE (y:Year {year: event.year})
MERGE (y)<--(e:Event {id: event.id})
RETURN e.id AS x ORDER BY x 