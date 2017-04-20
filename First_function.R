Df<-data.frame(Code1=c("A", "A", "B", "B", "B"), Code2=c("A", "A", "B", "C", "D"), Ok_email=c("Yes","No",NA,"Yes","Unknown"), stringsAsFactors = F)

F_c<-function(x,y){
  tab<-table(x,y, exclude=FALSE)
  nr<-nrow(tab)
  a<-numeric(nr)
  
    for (i in 1:nr){
      a[i]<-sum(tab[i,])
    }
  
  tab<-cbind(tab,Total=a)
  
  tab1<-tab[tab[,"Total"]>1,,drop=F]
  nr<-nrow(tab1)
  Correct<-character(length = nr)
  
    for (i in 1:nr){
      Correct[i]<-if (tab1[i,"No"]>0) {"No"} else if (tab1[i,"Yes"]>0) {"Yes"} else {"Unknown"}
    }
  
  
  tab1<-data.frame(cbind(tab1,Correct), stringsAsFactors = F)
  tab1
}