


#Create Data Frame

More simple:
A<-data.frame(Nombre=c("Victoria", "Javier", "Virginia", "Violeta", "Victoria"), Equipo=c("Madrid", NA, "Barcelona", 0,"Barcelona"), Sexo=c("f","m",NA,"f","f"), stringsAsFactors = F)

ALSO

A<-cbind(Nombre=c("Victoria", "Javier", "Virginia", "Violeta", "Victoria"), Equipo=c("Madrid", NA, "Barcelona", 0,"Barcelona"), Sexo=c("f","m",NA,"f","f"))
A<-as.data.frame(A)

#Even if it's a dataframe, it's columns are factors, so we change them:
i <- sapply(A, is.factor)
A[i] <- lapply(A[i], as.character)



  Nombre    Equipo Sexo
1 Victoria    Madrid    f
2   Javier      <NA>    m
3 Virginia Barcelona <NA>
4  Violeta         0    f
5 Victoria Barcelona    f

#Question 1: Does Sqldf groups by NA? Answer YES

	sqldf("select Sexo, count(Nombre) from A group by Sexo")
	Sexo count(Nombre)
	1 <NA>             1
	2    f             3
	3    m             1

#Question 2: Does Sqldf Counts NA? Answer NO

sqldf("select Nombre, count(Equipo) from A group by Nombre")
    Nombre count(Equipo)
1   Javier             0
2 Victoria             2
3  Violeta             1
4 Virginia             1


#Question 3: Does Sqldf treats "" as NA? Answer NO, Sql counts "" in all cases:

A[is.na(A)]<-""
A[2,3]<-""
A[1,3]<-""
	
		   Nombre count(Sexo)
	1   Javier           1
	2 Victoria           2
	3  Violeta           1
	4 Virginia           1

#Question 4: How does SQL treats "" in WHERE clause? JUST LIKE A NORMAL CHARACTER STRING

#Question 5: How does SQL treats NA in WHERE clause? like NULL value:

A[2,2]<-NA

	sqldf("select Nombre, count(Sexo) from A WHERE Equipo is NULL group by Nombre")
	  Nombre count(Sexo)
	1 Javier   

What if the field in the where clause has NA? Sqldj won't count or consider any case that has NA, unless you specify IS NULL:

 A
    Nombre    Equipo Sexo
1 Victoria    Madrid     
2   Javier      <NA>     
3 Virginia Barcelona     
4  Violeta         0    f
5 Victoria Barcelona    f

> sqldf("select Sexo, count(Nombre) from A WHERE Equipo = 'Barcelona' group by Sexo")
  Sexo count(Nombre)
1                  1
2    f             1
#In the following command I would have expected 3 counts of NOMBRE, since three of them are not BCN, but one is NA:
> sqldf("select Sexo, count(Nombre) from A WHERE Equipo <> 'Barcelona' group by Sexo")
  Sexo count(Nombre)
1                  1
2    f             1

# So you fix it this way:
sqldf("select Sexo, count(Nombre) from A WHERE Equipo <> 'Barcelona' OR Equipo is NULL group by Sexo")
  Sexo count(Nombre)
1                  2
2    f             1
