#Create DB
A<-cbind(Nombre=c("Victoria", "Javier", "Virginia", "Violeta", "Trump"), Equipo=c("Madrid", NA, "Barcelona", 0,""), Sexo=c("f","m",NA,"","f"))
A<-as.data.frame(A)

#Change all values that match a certain criteria

A[A=="Victoria"]<-"Javier"