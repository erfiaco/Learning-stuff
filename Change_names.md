#Create Data Frame
A<-cbind(Nombre=c("Victoria", "Javier", "Virginia", "Violeta"), Equipo=c("Madrid", NA, "Barcelona", 0))
A<-as.data.frame(A)

library(reshape)
Dbb <- rename(A, c(Nombre = "Nombreeeees", Vaca = "Vacuno"))

