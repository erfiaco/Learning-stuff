#Create Data Frame
A<-cbind(Nombre=c("Victoria", "Javier", "Virginia", "Violeta"), Equipo=c("Madrid", NA, "Barcelona", 0))
A<-as.data.frame(A)

#Even if it's a dataframe, it's columns are factors, so we change them:
i <- sapply(A, is.factor)
A[i] <- lapply(A[i], as.character)

#I want to create a subset of centain rows that meet one condition, they are inside a specified vector:

A_<-A[A$Nombre %in% c("Ivanka","Virginia","Violeta"),]

    Nombre    Equipo
3 Virginia Barcelona
4  Violeta         0

# The difference between %in% and == arise when in the column we are looking for matching variables there is an NA

A[A$Equipo == "Barcelona" | A$Equipo == "Betis",]


     Nombre    Equipo
NA     <NA>      <NA>
3  Virginia Barcelona

A[A$Equipo %in% c("Barcelona", "Betis"),]

    Nombre    Equipo
3 Virginia Barcelona

#Exactly what matches what is to some extent a matter of definition. For all types, NA matches NA and no other value. For real and complex values, NaN values are regarded as matching any other NaN value, but not matching NA.
#That %in% never returns NA makes it particularly useful in if conditions.
#Match functions gives me a vector of 0 and 1, then if I specify >0, then it'll give me vector of TRUE & FALSE

#for the !in function define:
"%!in%" <- function(x,table) match(x,table, nomatch = 0) == 0 

#Anyway, if you want to use == then:
A[A$Equipo == "Barcelona" & !is.na(A$Equipo) | A$Equipo == "Betis"&!is.na(A$Equipo),]

#IMPORTANT
#Difference between != and %!in%

> A[A$Equipo %!in% "Barcelona",]

    Nombre Equipo
1 Victoria Madrid
2   Javier   <NA>
4  Violeta      0

> A[A$Equipo != "Barcelona",]

     Nombre Equipo
1  Victoria Madrid
NA     <NA>   <NA>
4   Violeta      0

#The second one doesn't brings me the NA.