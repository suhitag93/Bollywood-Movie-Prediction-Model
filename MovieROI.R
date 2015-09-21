## muv is a vector array of movies
## x<- lapply(muv,ROI)                       ##this returns a list
## do.call(rbind,lapply(muv,ROI))            ##this returns a matrix in the right format
## result<- data.frame(do.call(rbind,lapply(muv,ROI)))


df<- data.frame(read.csv("Merged.csv",colClasses="character",header=TRUE))
  
ROI<- function (muv=df$Movie){
  
  #Read Movie Revenue file:
  Movie_DF <- read.csv("Merged.csv",colClasses = "character")  
  m<- Movie_DF[Movie_DF$Movie== muv,]
  
  ##Convert from character to numeric
  m[,"Budget"]<- as.numeric(m[,"Budget"])
  m$Lifetime<-as.numeric(m$Lifetime)
  
  #declare vector to be returned
  percent_roi<-vector()
  profit<- vector()
  
    profit<- (m[,"Lifetime"] - m[,"Budget"])
    percent_roi<- (profit/m[,"Budget"])*100
  
  l_ROI<- data.frame(cbind(m$Movie,m$Budget ,round(profit,2),round(percent_roi,3),m$Cast,m$Genre))
  colnames(l_ROI)<- c("Movie","Budget","ROI_Cr","pct_ROI","Cast","Genre")
  return (l_ROI)
}


