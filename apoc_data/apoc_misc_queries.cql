//Splitting Text In Neo4j Using APOC
RETURN apoc.text.split('I love you', ' +')

RETURN apoc.text.split('Ability to work is a virtue', ' +')

//Joining Text In Neo4j Using APOC
RETURN apoc.text.join(["Ability", "to", "work", "is", "a", "virtue"], " ")

//Capitalising Text In Neo4j Using APOC
RETURN apoc.text.capitalize("india")

RETURN apoc.text.capitalizeAll("united states of america")


// DeCapitlising Text In Neo4j Using APOC
RETURN apoc.text.capitalize("united states of america")
RETURN apoc.text.decapitalize("United States Of America")
RETURN apoc.text.decapitalizeAll("United States Of America")

//toUpperCase In Neo4j Using APOC
RETURN apoc.text.toUpperCase("this is lovely")
RETURN apoc.text.toUpperCase("toUpper")
RETURN apoc.text.toUpperCase("like-wise")
RETURN apoc.text.toUpperCase("venkat@gmail.com")
RETURN apoc.text.toUpperCase("veNkat@gmail.com")
RETURN apoc.text.toUpperCase("ve2nKat@gmail.co!m")
RETURN apoc.text.toUpperCase("ven8Kat@gmail.co!m")
RETURN apoc.text.toUpperCase("v3enKat@gma#il.co!m")
RETURN apoc.text.snakeCase("venKat@gma#il.co!m")
