

expected_ROI<- function(muv){
  
  #load data frame
  Up<-read.csv("Final.csv",colClasses = "character")
  
  #match movies:
  m<- Up[Up$Movie== muv,]
  
  #pull out the cast of the movie:
  act_list<-unlist(strsplit(m$Cast,","))
  
  #take out the average ROI% for each actor:
  act_list<-data.frame(do.call(rbind,lapply(act_list,Act_Avg_ROI)))
  expt_ROI<-mean(as.numeric(as.character(act_list$act_pwr)))
  expt_bgt<-mean(as.numeric(as.character(act_list$avg_bgt)))
  rtn<-cbind(m$Movie,expt_ROI,expt_bgt)
  colnames(rtn)<-c("Movie","Expected ROI pct","Expected Bgt")
  return(rtn)
}