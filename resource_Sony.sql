Create (r:Employee{name:"Ruth", position:"Manager", age:"40", salary:9000, department:"Sales", join_date:"2014-01-12"})-[:WORKS_IN]->(c:Company{name:"Sony Inc", Location:"Tokyo"}),
(r)-[:SUPERVISES]->(a:Employee{name:"Andrew", position:"Sales Rep", age:"23", salary:2100,department:"Sales", join_date:"2018-05-14"})-[:WORKS_IN]->(c),
(r)-[:SUPERVISES]->(s:Employee{name:"Solomon", position:"Sales Rep", age:"33", salary:3500, department:"Sales",join_date:"2007-09-22"})-[:WORKS_IN]->(c),
(r)-[:SUPERVISES]->(k:Employee{name:"Kelvin", position:"Sales Rep", age:"25", salary:1900,department:"Sales", join_date:"2013-04-17"})-[:WORKS_IN]->(c),
(r)-[:REPORTS_TO]->(d:Employee{name:"Donald", position:"MD/CEO", age:"39", salary:55000, join_date:"2000-07-22"})-[:WORKS_IN]->(c),
(j:Employee{name:"John", position:"Manager", age:"55", salary:10000, department:"Finance", join_date:"2019-02-04"})-[:WORKS_IN]->(c),
(j)-[:SUPERVISES]->(m:Employee{name:"Mary", position:"Accountant", department:"Finance",age:"21", salary:5000, join_date:"2019-06-14"})-[:WORKS_IN]->(c),
(j)-[:SUPERVISES]->(t:Employee{name:"Tony", position:"Auditor", department:"Finance", age:"29", salary:7000, join_date:"2016-05-18"})-[:WORKS_IN]->(c),
(j)-[:REPORTS_TO]->(d)
