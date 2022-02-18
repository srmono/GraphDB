// Patterns and pattern-matching are at the very heart of Cypher, so being effective with Cypher requires a good understanding of patterns.
// Using patterns, you describe the shape of the data you are looking for. For example, in the MATCH clause you describe the shape with a pattern, and Cypher will figure out how to get that data for you.
// The pattern describes the data using a form that is very similar to how one typically draws the shape of property graph data on a whiteboard: usually as circles (representing nodes) and arrows between them to represent relationships.
// Patterns appear in multiple places in Cypher: in MATCH, CREATE and MERGE clauses, and in pattern expressions. Each of these is described in more detail in:

// MATCH
// OPTIONAL MATCH
// CREATE
// MERGE
// Using path patterns in WHERE

// Patterns for nodes
//This simple pattern describes a single node, and names that node using the variable a.
(a)

// Patterns for related nodes
//two nodes, and a single relationship from one to the other
(a)-->(b)

//Such a series of connected nodes and relationships is called a "path".
//**Note: that the naming of the nodes in these patterns is only necessary should one need to refer to the same node again, either later in the pattern or elsewhere in the Cypher query. If this is not necessary, then the name may be omitted, as follows:
(a)-->(b)<--(c)

// Patterns for labels
(a:User)-->(b)

//Describe a node that has multiple labels:
(a:User:Admin)-->(b)


// Specifying properties
(a {name: 'Andy', sport: 'Brazilian Ju-Jitsu'})

//A relationship with expectations on it is given by:
(a)-[{blocked: false}]->(b)

// Patterns for relationships
(a)--(b)

// As with nodes, relationships may also be given names. In this case, a pair of square brackets is used to break up the arrow and the variable is placed between. For example:
(a)-[r]->(b)

//Much like labels on nodes, relationships can have types. To describe a relationship with a specific type, you can specify this as follows:
(a)-[r:REL_TYPE]->(b)

//Unlike labels, relationships can only have one type. But if we’d like to describe some data such that the relationship could have any one of a set of types, then they can all be listed in the pattern, separating them with the pipe symbol | like this:
(a)-[r:TYPE1|TYPE2]->(b)

//As with nodes, the name of the relationship can always be omitted, as exemplified by:
(a)-[:REL_TYPE]->(b)

// Variable-length pattern matching
//***Rather than describing a long path using a sequence of many node and relationship descriptions in a pattern, 
// many relationships (and the intermediate nodes) can be described by specifying a length in 
// the relationship description of a pattern. For example:
(a)-[*2]->(b)

//This describes a graph of three nodes and two relationships, all in one path (a path of length 2). This is equivalent to:
(a)-->()-->(b)

//A range of lengths can also be specified: such relationship patterns are called 'variable length relationships'. For example:
//This is a minimum length of 3, and a maximum of 5. It describes a graph of either 4 nodes and 3 relationships, 
// 5 nodes and 4 relationships or 6 nodes and 5 relationships, all connected together in a single path.

(a)-[*3..5]->(b)
//Either bound can be omitted. For example, to describe paths of length 3 or more, use:
(a)-[*3..]->(b)

//To describe paths of length 5 or less, use
(a)-[*..5]->(b)

//Omitting both bounds is equivalent to specifying a minimum of 1, allowing paths of any positive length to be described:
(a)-[*]->(b)

// refer Patterns Graph (image)
//This query finds data in the graph with a shape that fits the pattern: specifically a node (with the name property 'Filipa') and then the KNOWS related nodes, one or two hops away. This is a typical example of finding first and second degree friends.

//**Note that variable length relationships cannot be used with CREATE and MERGE.

MATCH (me)-[:KNOWS*1..2]-(remote_friend)
WHERE me.name = 'Filipa'
RETURN remote_friend.name

// Assigning to path variables

p = (a)-[*3..5]->(b)
