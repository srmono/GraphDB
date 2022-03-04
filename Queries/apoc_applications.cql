// Code: Explanation and Application of APOC on Date in Neo4j

WITH apoc.date.parse("10/03/2024", "ms", "dd/mm/yyyy") as input 
RETURN date(datetime({epochmillis:input})) AS date

WITH apoc.date.parse("10-03-2024", "ms", "dd-mm-yyyy") as input 
RETURN date(datetime({epochmillis:input})) AS date


WITH apoc.date.parse("2020-30-01", "ms", "yyyy-dd-mm") as input 
RETURN date(datetime({epochmillis:input})) AS date


WITH apoc.date.parse("Thu, 23 July 2020", "ms", "EEE, dd MMMMM yyyy") as input 
RETURN date(datetime({epochmillis:input})) AS date


