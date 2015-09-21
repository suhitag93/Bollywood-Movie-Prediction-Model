

#set up twitter authorization
#Twitter API Credentials Connection:

api_key<-"E6Su7LkX0GwxFP8w5eedGF5tA"
api_secret<-"VH1s1imKNylxkjpb5Rv1ULesTM1HKwNtJK2bFsH2D57qLhieI9"
token<-"1656072950-WjP4EvWYMlIOQHl4m4OQZ5INbMKUwMy6Tq4coBy"
token_secret<-"M1058nmHZ0BNWTBrhJRhCVfYJjGoTDtM4ZcCZkXN1ddTv"

merged_RS[,"Release_Date"]<-as.Date(merged_RS[,"Release_Date"])
                
setup_twitter_oauth(api_key, api_secret, token, token_secret)
#load tweets to DB
tweets<- searchTwitter("#TanuWedsManuReturns",n=200,since=,until=)

TweetLoad<- function(hashtag){
  
  api_key<-"E6Su7LkX0GwxFP8w5eedGF5tA"
  api_secret<-"VH1s1imKNylxkjpb5Rv1ULesTM1HKwNtJK2bFsH2D57qLhieI9"
  token<-"1656072950-WjP4EvWYMlIOQHl4m4OQZ5INbMKUwMy6Tq4coBy"
  token_secret<-"M1058nmHZ0BNWTBrhJRhCVfYJjGoTDtM4ZcCZkXN1ddTv"
  merged_RS[,"Release_Date"]<-as.Date(merged_RS[,"Release_Date"])
  
  setup_twitter_oauth(api_key, api_secret, token, token_secret)

  social_media<-read.csv("Social Media.csv",colClasses="character")
  
  movie_match<-social_media[social_media$Hashtag==hashtag]
  
  trailer_date<- movie_match$Trailer.Date
  
  #setup twitter authentication:
  
  api_key<-"E6Su7LkX0GwxFP8w5eedGF5tA"
  api_secret<-"VH1s1imKNylxkjpb5Rv1ULesTM1HKwNtJK2bFsH2D57qLhieI9"
  token<-"1656072950-WjP4EvWYMlIOQHl4m4OQZ5INbMKUwMy6Tq4coBy"
  token_secret<-"M1058nmHZ0BNWTBrhJRhCVfYJjGoTDtM4ZcCZkXN1ddTv"
  merged_RS[,"Release_Date"]<-as.Date(merged_RS[,"Release_Date"])
  
  setup_twitter_oauth(api_key, api_secret, token, token_secret)
}
