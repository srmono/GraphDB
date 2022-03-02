// Code: Explanation and Application of APOC on Date in Neo4j
i.

RETURN date("2020-10-07") AS date

ii.

WITH [x in split('2020/11/07', '/') | toInteger(x)] AS dateElements

RETURN date({day:dateElements[2], month:dateElements[1], year:dateElements[0]}) AS date

iii.
WITH apoc.date.parse("2020/11/07",  "ms",  "dd/MM/yyyy") AS input
RETURN date(datetime({epochmillis: input})) AS date




