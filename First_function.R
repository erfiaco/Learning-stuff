Df<-data.frame(Code1=c("A", "A", "B", "B", "B"), Country=c("Austria", "Germany", "Italy", "Italy", "Italy"), Code2=c("A", "A", "B", "C", "D"), Ok_email=c("Yes","No",NA,"Yes","Unknown"), stringsAsFactors = F)

F_c<-function(Country,x,y){
  #attach(Dataframe)
  tab<-table(x,y, exclude=FALSE)
  nr<-nrow(tab)
  a<-numeric(nr)
  db<-cbind(x,y)
  email_country<-data.frame(cbind(x,Country), stringsAsFactors = FALSE)
  library(plyr)
  
  email_country<-unique(email_country)
  
    for (i in 1:nr){
      a[i]<-sum(tab[i,])
    }
  
  tab<-cbind(x=rownames(tab), tab, Total=a)
  merge.data.frame(x=tab,y=email_country, by = "x")
  
  #tab1<-tab[tab[,"Total"]>1,,drop=F]
  #nr<-nrow(tab1)
  Correct<-character(length = nr)
  tabf<-data.frame(cbind(tab,Correct), stringsAsFactors = FALSE)

    for (i in 1:nr){
      #Correct[i]<-if (tab1[i,"No"]>0) {"No"} else if (tab1[i,"Yes"]>0) {"Yes"} else {"Unknown"}
      tabf$Correct[i]<-if (tab[i,"No"]>0) {"No"} else if (tab[i,"Yes"]>0) {"Yes"} else {"Unknown"}
    }
  
  #check<-join(bd, tabf, by="x")
  #check
  tabf
}