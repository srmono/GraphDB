SHOW DATABASES
SHOW DATABASE movies YIELD * // full details
SHOW DEFAULT DATABASE
SHOW DATABASES YIELD name, currentStatus, requestedStatus ORDER BY currentStatus WHERE name CONTAINS 'e'


CREATE DATABASE customers IF NOT EXISTS
//This is equivalent to running DROP DATABASE customers IF EXISTS followed by CREATE DATABASE customers.
CREATE OR REPLACE DATABASE customers

ALTER DATABASE customers SET ACCESS READ ONLY

SHOW DATABASES yield name, access

STOP DATABASE customers

START DATABASE customers

SHOW DATABASE customers

DROP DATABASE customers

DROP DATABASE customers IF EXISTS

CREATE ALIAS `test-2022` FOR DATABASE `test`
ALTER ALIAS `test-2022` SET DATABASE TARGET `test1`
DROP ALIAS `test-2022` FOR DATABASE

---------------------

SHOW CURRENT USER
  [YIELD { * | field[, ...] } [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]
  [WHERE expression]
  [RETURN field[, ...] [ORDER BY field[, ...]] [SKIP n] [LIMIT n]]

	
SHOW CURRENT USER
	
SHOW USERS

CREATE USER name [IF NOT EXISTS]
  SET [PLAINTEXT | ENCRYPTED] PASSWORD 'password'
  [[SET PASSWORD] CHANGE [NOT] REQUIRED]
  [SET STATUS {ACTIVE | SUSPENDED}]
  [SET HOME DATABASE name]

RENAME USER name [IF EXISTS] TO otherName

ALTER CURRENT USER SET PASSWORD FROM 'oldPassword' TO 'newPassword'

DROP USER name [IF EXISTS]


