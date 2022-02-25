//SHOW FUNCTIONS
//SHOW TRANSACTIONS
//SHOW PROCEDURES

//List Users AND ROLES
SHOW USERS 
SHOW ROLES

//-------------SHOW FUNCTIONS----------------------//

//--The command SHOW FUNCTIONS returns only the default output. For a full output use the optional YIELD command. Full output: SHOW FUNCTIONS YIELD *.
//Listing all functions
SHOW FUNCTIONS 


//Syntax - List functions, either all or only built-in or user-defined
SHOW [ALL|BUILT IN|USER DEFINED] FUNCTION[S]
[YIELD { * | field[, ...] } [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]
[WHERE expression]
[RETURN field[, ...] [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]

//** When using the RETURN clause, the YIELD clause is mandatory and must not be omitted.


//Listing functions with filtering on output columns
SHOW BUILT IN FUNCTIONS YIELD name, isBuiltIn
WHERE name STARTS WITH 'a'

// Listing functions with other filtering
SHOW FUNCTIONS EXECUTABLE BY CURRENT USER YIELD *

//--filter for a specific user:
SHOW FUNCTIONS EXECUTABLE BY venkat 



//-------------SHOW TRANSACTIONS------------------------//
//The SHOW TRANSACTIONS command is used to display running transactions within the instance.
//The command SHOW TRANSACTIONS returns only the default output. For a full output use the optional YIELD command. Full output: SHOW TRANSACTIONS YIELD *.


//Syntax -- List transactions on the current server
SHOW TRANSACTION[S] [transaction-id[,...]]
[YIELD { * | field[, ...] } [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]
[WHERE expression]
[RETURN field[, ...] [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]

//***When using the RETURN clause, the YIELD clause is mandatory and must not be omitted.



//Listing all transactions
SHOW TRANSACTIONS

//Listing transactions with filtering on output columns
SHOW TRANSACTIONS YIELD database, currentQuery WHERE currentQuery contains 'show'


//Listing specific transactions
//It is possible to specify which transactions to return in the list by transaction ID.
SHOW TRANSACTIONS "foreachclause-transaction-327"


// TERMINATE TRANSACTIONS
// The TERMINATE TRANSACTIONS command is used to terminate running transactions by their IDs.
//Syntax -- Terminate transactions by ID on the current server

TERMINATE TRANSACTION[S] transaction_id[, ...]

//Terminate Transactions
TERMINATE TRANSACTIONS "foreachclause-transaction-327", "foreachclause-transaction-328"
TERMINATE TRANSACTIONS "neo4j-transaction-1","neo4j-transaction-2"


//-------------SHOW PROCEDURES----------------------//
//The command SHOW PROCEDURES returns only the default output. 
//For a full output use the optional YIELD command. Full output: SHOW PROCEDURES YIELD *.

//Syntax -- List all procedures

SHOW PROCEDURE[S]
[YIELD { * | field[, ...] } [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]
[WHERE expression]
[RETURN field[, ...] [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]

//*** When using the RETURN clause, the YIELD clause is mandatory and must not be omitted.

// syntax -- List procedures that the current user can execute
SHOW PROCEDURE[S] EXECUTABLE [BY CURRENT USER]
[YIELD { * | field[, ...] } [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]
[WHERE expression]
[RETURN field[, ...] [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]

//Syntax -- List procedures that the specified user can execute
SHOW PROCEDURE[S] EXECUTABLE BY username
[YIELD { * | field[, ...] } [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]
[WHERE expression]
[RETURN field[, ...] [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]


//Listing the available procedures can be done with 
SHOW PROCEDURES.


//Listing procedures with filtering on output columns
//The listed procedures can be filtered in multiple ways, one way is to use the WHERE clause. For example, returning the names of all admin procedures:
SHOW PROCEDURES YIELD name, admin
WHERE admin

//Listing procedures with other filtering
SHOW PROCEDURES EXECUTABLE BY CURRENT USER YIELD *
 
//filters the list to only contain procedures executable by a specific user:
SHOW PROCEDURES EXECUTABLE BY venkat