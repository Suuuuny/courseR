# library(rvest)
# library(magrittr)
# 
# Di_MayAppnews <- read.csv("Di_MayAppnews")
# Di_AprAppnews <- read.csv("Di_AprAppnews")
# Di_MarAppnews <- read.csv("Di_MarAppnews")
# Di_FebAppnews <- read.csv("Di_FebAppnews")
# Di_JanAppnews <- read.csv("Di_JanAppnews")
# 
# Di_Appnews <- rbind(Di_MayAppnews, Di_AprAppnews, Di_MarAppnews, Di_FebAppnews, Di_JanAppnews)
# sum(is.na(Di_Appnews$time)) #QQ
# 
# #去掉含有NA值的欄位QQ
# Di_Appnews <- Di_Appnews %>% na.omit()
# 
# 
# #用strsplit將 報導） 後面的雜訊清掉
# cleancontent <- c()
# for( i in 1:length(Di_Appnews$time)){
#   t <- strsplit(Di_Appnews$time[i] %>% as.character() , "報導）")
#   t <- t[[1]][1]
#   cleancontent <- rbind(cleancontent, t)
#   print(i)
# }
# 
# cleancontent <- data.frame(cleancontent)
# 
# #切割時間
# Di_Appnews <- Di_Appnews %>% separate(text, c("出版時間","ttime"),"：") 
# #將text的欄位切成出版時間和time兩欄欄
# Di_Appnews <- Di_Appnews %>% separate(ttime, c("ttime","stime")," ") 
# Di_Appnews <- Di_Appnews %>% separate(ttime, c("year","month", "day"),"/") 
# Ding_Appnews <- cbind(Di_Appnews$title, Di_Appnews$year, Di_Appnews$month, Di_Appnews$day, cleancontent)
# 
# colnames(Ding_Appnews) <- c("title", "year", "month", "day", "content")
# 
# #增加Media的欄位
# Media <- c()
# text <- c("Apple")
# for( i in 1:length(Ding_Appnews$content)){
#   Media <- rbind(Media, text)
# }
# 
# Ding_Appnews <- cbind(Media, Ding_Appnews)
# 
# write.csv(Ding_Appnews, "Ding_Appnews")

#Bind上其他媒體的新聞
#打開蘋果、中時的丁新聞
Ding_Appnews <- read.csv("Appnews/Ding_Appnews")
Ding_CTnews <- read.csv("CTnews/Ding_CTnews")

#幫中時的媒體欄位改名
#增加Media的欄位
Media <- c()
text <- c("CT")
for( i in 1:length(Ding_CTnews$content)){
  Media <- rbind(Media, text)
}

#將中時的媒體欄位值換成另一欄
Ding_CTnews$Media <- Media

library(magrittr)
Ding_CTnews <- Ding_CTnews[ , 2:7] %>% data.frame()
Ding_Appnews <- Ding_Appnews[, 2:7] %>% data.frame()

#bind中時和蘋果的新聞
#用rbind會出現 Error in rownames(value[[jj]])[ri] <- rownames(xij) : 置換的長度為零
#不知如何解決，所以用了dplyr的bind_rows
library(dplyr)
Ding_news <- bind_rows(Ding_CTnews, Ding_Appnews)

#存檔
write.csv(Ding_news,"Ding_news")








