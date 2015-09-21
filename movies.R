df<- data.frame(read.csv("Movie Revenue Metrics.csv",colClasses="character",header=TRUE))

levels(df$Year)

Annual_Revenues<-function(df){
#Total annual revenues ion crores
aggregate((Lifetime-Total.Budget)~Year, data=Movie_DF,FUN = sum)
  #Annual_Agg<-aggregate(Lifetime~Year,data=Movie_DF,FUN= sum)    
}


#Twitter API Credentials Connection:

#api_key<-"E6Su7LkX0GwxFP8w5eedGF5tA"
#api_secret<-"VH1s1imKNylxkjpb5Rv1ULesTM1HKwNtJK2bFsH2D57qLhieI9"
#token<-"1656072950-WjP4EvWYMlIOQHl4m4OQZ5INbMKUwMy6Tq4coBy"
#token_secret<-"M1058nmHZ0BNWTBrhJRhCVfYJjGoTDtM4ZcCZkXN1ddTv"

#setup_twitter_oauth(api_key, api_secret, token, token_secret)

MR<- read.csv("Movie Revenue.csv")

SM<- read.csv("Social Media.csv")

MRG<-merge(MR,SM,by.x="Movie",by.y="Movie")

write.csv(MRG,"Merged.csv")

V<-data.frame(do.call(rbind,lapply(df$Movie,Verdict)))

Final<-merge(V,ROI(),by.x="Movie",by.y="Movie")

Final<-merge(FINAL,SM,by.x="Movie",by.y="Movie")

Y<-merge(x,Final,by.x="m.Movie",by.y="Movie")

Finalwrite.csv(FINAL,"Final.csv")
FINAL$ROI.pct<-as.numeric(as.character(FINAL$ROI.pct))
FINAL$FB.Following<-as.numeric(as.character(FINAL$FB.Following))
FINAL$Days.between.Releases<-as.numeric(as.character(FINAL$Days.between.Releases))

## cor(xyz$`No. of Films`,xyz$`act avg ROI`)
## [1] 0.06410073

## cor(xyz$`avg Budget`,xyz$`avg ROI`)
## [1] -0.05391568

lm(formula = ROI.pct ~ FB.Following+Days.between.Releases, data=FINAL)
