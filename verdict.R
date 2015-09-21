## muv is a vector of movies
## result<- lapply(muv,Verdict)                          returns a list of movies n their verdicts
## do.call(rbind,lapply(muv,Verdict))           binds them into a matrix
## result<-data.frame(do.call(rbind,lapply(muv,Verdict)))


df<- data.frame(read.csv("Merged.csv",colClasses="character",header=TRUE))
Verdict<- function(muv){
  #create dataframe
  m<- ROI(muv)
  #create subset of above data frame
  
  m["pct_ROI"]<- as.numeric(as.character.factor(m[,"pct_ROI"]))
  m$ROI<- as.numeric(as.character.factor(m$ROI))
  verdict<-vector()
  roi<-as.numeric(as.character(m[,"pct_ROI"]))
  if(roi <= -100 )
  verdict<- "Disaster"
  else if ((roi<=-50)&(roi>-100))
    verdict<- "Flop"
  else if ((roi>=-50)&(roi<=0))
    verdict<- "Losing"
  else if ((roi>0)&(roi<=20))
    verdict<- "Average"
  else if ((roi>20)&(roi<=100))
    verdict<- "Semi - Hit"
  else if ((roi>100)&(roi<120))
    verdict<- "Hit"
  else if ((roi>=120)&(roi<280))
    verdict<- "Super Hit"
  else if (roi>=280)
    verdict<- "Blockbuster"
  roi<-as.numeric(as.character(roi))
  df<- cbind(muv,roi,verdict)
  colnames(df)<-c("Movie","ROI pct","Verdict")
  return (df)
}