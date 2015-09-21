
No_of_Films<- function(){
  #Read CSV
  Movie_DF <- read.csv("Movie Revenue.csv",colClasses="character")
  act<-Movie_DF$Cast
  act<- strsplit(act,",")
  act<- unlist(act)
  Actor_List<- data.frame(table(act))
  names(Actor_List)<-c("Actor","No. of Films")
  return (Actor_List)
}

No_of_Hits<- function(){
  #Read CSV
  DF <- read.csv("Movie Revenue.csv",colClasses="character")
  #call ROI DF for all movies
  ROI_DF<-ROI()
  
  #Call verdict DF for all movies
  VER<-data.frame(do.call(rbind,lapply(DF$Movie,Verdict)))
  
  #merge ROI_DF and VER:
  MERGED <- merge(ROI_DF,VER,by.x = "Movie",by.y = "muv")
  
  #subset MERGED
  SUB_MERGED<- MERGED[MERGED$verdict %in% c("Average","Plus","Hit","Super Hit","Blockbuster"),]
  
  act<-as.character(SUB_MERGED$Cast)
  act<- strsplit(act,",")
  act<- unlist(act)
  Actor_List<- data.frame(table(act))
  names(Actor_List)<-c("Actor","No. of Hits")
  return (Actor_List)
}
actor_list<-No_of_Films()

Act_Avg_ROI<-function(act){
  
  #pull data frame from ROI
  ROI_DF<-ROI()
  #create cast vector:
  ROI_DF$Cast <- as.character(ROI_DF$Cast)
  ROI_DF[,"pct_ROI"]<-as.numeric(as.character(ROI_DF[,"pct_ROI"]))
  ROI_DF[,"ROI_Cr"]<-as.numeric(as.character(ROI_DF[,"ROI_Cr"]))
  act_ROI<-NULL
  act_pctROI<-NULL
  act_bgt<-NULL
  #check for act in Cast
  ary<-grep(act,ROI_DF$Cast)
  
  for (i in ary){
    #print(i)
    act_pctROI <-c(act_ROI,ROI_DF[i,"pct_ROI"])
    act_ROI <-c(act_ROI,ROI_DF[i,"ROI_Cr"])
    act_bgt<- c(act_bgt,ROI_DF[i,"Budget"])
  }
  #print(act_ROI)
  result<- data.frame(cbind(act,mean(act_ROI),mean(act_pctROI),mean(act_bgt)))
  names(result)<-c("Actor","Mean ROI percent","Mean ROI in Cr","Avg Budget of Movie")
  return(result)
         
}

Merge_Actor_List<- function(){
  a<- No_of_Films()
  b<- No_of_Hits()
  c<-merge.data.frame(a,b,by.x="Actor",by.y ="Actor" )
  d<-data.frame(do.call(rbind,lapply(act,Act_Avg_ROI)))
  Actor_DF<-merge.data.frame(c,d ,by.x="Actor",by.y ="Actor" )
  
}

