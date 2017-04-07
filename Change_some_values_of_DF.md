#Change Value of some fields, those that meet certain characteristics:

#Create Data Frame
A<-cbind(Nombre=c("Victoria", "Javier", "Virginia", "Violeta"), Equipo=c("Madrid", NA, "Barcelona", 0))
A<-as.data.frame(A)


#Change value, it is important to specify the is.na clause, otherwise it won't let you do it

A[A$Equipo==0&!is.na(A$Equipo),"Equipo"]<-"No_info"

#Otherwise

A[A$Equipo %in% 0, "Equipo"]<-"No_info"

#Change the NA for some other value:
A[is.na(A$Equipo), "Equipo"]<-"No_info"