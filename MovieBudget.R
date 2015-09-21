## muv is a vector array of movies
## x<- lapply(muv,Movie_Budget)                       ##this returns a list
## do.call(rbind,lapply(muv,Movie_Budget))            ##this returns a matrix in the right format
## data.frame(do.call(rbind,lapply(muv,Movie_Budget)))

df<- data.frame(read.csv("Movie Revenue.csv",colClasses="character",header=TRUE))
Movie_Budget<- function(muv){
  #Read Movie Revenue file:
  Movie_DF <- read.csv("Movie Revenue.csv",colClasses="character")  
  
  m<-Movie_DF[Movie_DF[,"Movie"]==muv, ] 
  budget<- as.numeric(m[,"Total.Budget"])
  
  if(is.na(budget))
  {
    b<- "Budget unavailable"
  }  
  else{
    if(budget<10)
    {
      b<-"Very Low Budget"
    }
    else if ((budget<15)&(budget>10))
    {
      b<-"Low Budget" 
    }
    else if ((budget<=30)&(budget>15))
    {
      b<-"Medium Budget"
    }
    else if ((budget<=50)&(budget>30))
    {
      b<-"Medium to Big Budget"
    }
    else
      b<- "Big Budget"
  }
  Category<- b
  df<- cbind(muv,Category,budget)
  return(df)
}