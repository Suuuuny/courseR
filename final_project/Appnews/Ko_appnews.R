# library(rvest)
# library(magrittr)
# library(httr)
# 
# # #爬柯文哲五月的新聞
# #爬全部柯文哲五月新聞搜尋頁面的連結
# url <- "https://tw.appledaily.com/search"
# Ko_MayApplinks <- c()
# 
# #爬全部連結的迴圈
# for(p in 1:75){
#   form <- list(searchType = "text",
#                keyword = "柯文哲",
#                totalpage = "741",
#                page = sprintf("%d" , p ),
#                sorttype = "1",
#                rangedate = "[20180501 TO 20180531999:99]")
#   res <- POST(url, body = form)
#   doc.str <- content(res, "text")
#   doc <- read_html(doc.str)
#   css <- "#result > li > div > h2 > a"
#   links <- html_attr(html_nodes(doc,css), "href")
#   Ko_MayApplinks <- c(Ko_MayApplinks, links)
#   message(p)
# }
# 
# #test是否抓到重複的網址
# test <- Ko_MayApplinks[?duplicated(Ko_MayApplinks)]
# 
# #爬五月連結的每一篇新聞
# #先寫可以爬每一篇新聞時間標題內文的function
# FindAppnews <- function(URL){
#   doc <- read_html(URL %>% as.character())
#   
#   title <- html_text(html_node(doc,  "#article > div.wrapper > div > main > article > hgroup > h1"))
#   text <- html_text(html_node(doc, "#article > div.wrapper > div > main > article > hgroup > div.ndArticle_creat"))
#   time <- html_text(html_node(doc, "#article > div.wrapper > div > main > article > div > div.ndArticle_contentBox > article > div > p"))
#   
#   output <- data.frame( title = title,
#                         text = text,
#                         time = time)
#   return(output)
# }
# 
# #爬柯文哲五月的每一篇新聞的時間標題內文
# Ko_MayAppnews <- data.frame()
# for ( t in 1:length(Ko_MayApplinks)) {
#   print(t)
#   output1 <- FindAppnews(Ko_MayApplinks[t]) 
#   Ko_MayAppnews <- rbind(Ko_MayAppnews, output1)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# #存檔
# write.csv(Ko_MayAppnews, "Ko_MayAppnews")
# 
# # #爬柯文哲四月的新聞
# #爬全部柯文哲四月新聞搜尋頁面的連結
# url <- "https://tw.appledaily.com/search"
# Ko_AprApplinks <- c()
# 
# #爬全部連結的迴圈
# for(p in 1:40){
#   form <- list(searchType = "text",
#                keyword = "柯文哲",
#                totalpage = "391",
#                page = sprintf("%d" , p ),
#                sorttype = "1",
#                rangedate = "[20180401 TO 20180430999:99]")
#   res <- POST(url, body = form)
#   doc.str <- content(res, "text")
#   doc <- read_html(doc.str)
#   css <- "#result > li > div > h2 > a"
#   links <- html_attr(html_nodes(doc,css), "href")
#   Ko_AprApplinks <- c(Ko_AprApplinks, links)
#   message(p)
# }
# 
# #test是否抓到重複的網址
# test <- Ko_AprApplinks[?duplicated(Ko_AprApplinks)]
# 
# #爬四月連結的每一篇新聞
# #爬柯文哲四月的每一篇新聞的時間標題內文
# Ko_AprAppnews <- data.frame()
# for ( t in 1:length(Ko_AprApplinks)) {
#   print(t)
#   output2 <- FindAppnews(Ko_AprApplinks[t]) 
#   Ko_AprAppnews <- rbind(Ko_AprAppnews, output2)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# #存檔
# write.csv(Ko_AprAppnews, "Ko_AprAppnews")
# 
# # #爬柯文哲三月的新聞
# #爬全部柯文哲三月新聞搜尋頁面的連結
# url <- "https://tw.appledaily.com/search"
# Ko_MarApplinks <- c()
# 
# #爬全部連結的迴圈
# for(p in 1:47){
#   form <- list(searchType = "text",
#                keyword = "柯文哲",
#                totalpage = "461",
#                page = sprintf("%d" , p ),
#                sorttype = "1",
#                rangedate = "[20180301 TO 20180331999:99]")
#   res <- POST(url, body = form)
#   doc.str <- content(res, "text")
#   doc <- read_html(doc.str)
#   css <- "#result > li > div > h2 > a"
#   links <- html_attr(html_nodes(doc,css), "href")
#   Ko_MarApplinks <- c(Ko_MarApplinks, links)
#   message(p)
# }
# 
# #test是否抓到重複的網址
# test <- Ko_MarApplinks[?duplicated(Ko_MarApplinks)]
# 
# #爬三月連結的每一篇新聞
# #爬柯文哲三月的每一篇新聞的時間標題內文
# Ko_MarAppnews <- data.frame()
# for ( t in 1:length(Ko_MarApplinks)) {
#   print(t)
#   output3 <- FindAppnews(Ko_MarApplinks[t]) 
#   Ko_MarAppnews <- rbind(Ko_MarAppnews, output3)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# for ( t in 332:length(Ko_MarApplinks)) {
#   print(t)
#   output3 <- FindAppnews(Ko_MarApplinks[t]) 
#   Ko_MarAppnews <- rbind(Ko_MarAppnews, output3)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# for ( t in 417:length(Ko_MarApplinks)) {
#   print(t)
#   output3 <- FindAppnews(Ko_MarApplinks[t]) 
#   Ko_MarAppnews <- rbind(Ko_MarAppnews, output3)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# 
# #存檔
# write.csv(Ko_MarAppnews, "Ko_MarAppnews")
# 
# # #爬柯文哲二月的新聞
# #爬全部柯文哲二月新聞搜尋頁面的連結
# url <- "https://tw.appledaily.com/search"
# Ko_FebApplinks <- c()
# 
# #爬全部連結的迴圈
# for(p in 1:34){
#   form <- list(searchType = "text",
#                keyword = "柯文哲",
#                totalpage = "334",
#                page = sprintf("%d" , p ),
#                sorttype = "1",
#                rangedate = "[20180201 TO 20180228999:99]")
#   res <- POST(url, body = form)
#   doc.str <- content(res, "text")
#   doc <- read_html(doc.str)
#   css <- "#result > li > div > h2 > a"
#   links <- html_attr(html_nodes(doc,css), "href")
#   Ko_FebApplinks <- c(Ko_FebApplinks, links)
#   message(p)
# }
# 
# #test是否抓到重複的網址
# test <- Ko_FebApplinks[?duplicated(Ko_FebApplinks)]
# 
# #爬二月連結的每一篇新聞
# #爬柯文哲二月的每一篇新聞的時間標題內文
# Ko_FebAppnews <- data.frame()
# for ( t in 1:length(Ko_FebApplinks)) {
#   print(t)
#   output4 <- FindAppnews(Ko_FebApplinks[t]) 
#   Ko_FebAppnews <- rbind(Ko_FebAppnews, output4)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# #存檔
# write.csv(Ko_FebAppnews, "Ko_FebAppnews")
# 
# # #爬柯文哲一月的新聞
# #爬全部柯文哲一月新聞搜尋頁面的連結
# url <- "https://tw.appledaily.com/search"
# Ko_JanApplinks <- c()
# 
# #爬全部連結的迴圈
# for(p in 1:41){
#   form <- list(searchType = "text",
#                keyword = "柯文哲",
#                totalpage = "406",
#                page = sprintf("%d" , p ),
#                sorttype = "1",
#                rangedate = "[20180101 TO 20180131999:99]")
#   res <- POST(url, body = form)
#   doc.str <- content(res, "text")
#   doc <- read_html(doc.str)
#   css <- "#result > li > div > h2 > a"
#   links <- html_attr(html_nodes(doc,css), "href")
#   Ko_JanApplinks <- c(Ko_JanApplinks, links)
#   message(p)
# }
# 
# #test是否抓到重複的網址
# test <- Ko_JanApplinks[?duplicated(Ko_JanApplinks)]
# 
# #爬一月連結的每一篇新聞
# #爬柯文哲一月的每一篇新聞的時間標題內文
# Ko_JanAppnews <- data.frame()
# for ( t in 1:length(Ko_JanApplinks)) {
#   print(t)
#   output4 <- FindAppnews(Ko_JanApplinks[t]) 
#   Ko_JanAppnews <- rbind(Ko_JanAppnews, output4)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# for ( t in 41:length(Ko_JanApplinks)) {
#   print(t)
#   output4 <- FindAppnews(Ko_JanApplinks[t]) 
#   Ko_JanAppnews <- rbind(Ko_JanAppnews, output4)
#   Sys.sleep(sample(1:10, 1))
#   
# }
# 
# 
# 
# #存檔
# write.csv(Ko_JanAppnews, "Ko_JanAppnews")




# library(rvest)
# library(magrittr)
# 
# Ko_MayAppnews <- read.csv("Ko_MayAppnews")
# Ko_AprAppnews <- read.csv("Ko_AprAppnews")
# Ko_MarAppnews <- read.csv("Ko_MarAppnews")
# Ko_FebAppnews <- read.csv("Ko_FebAppnews")
# Ko_JanAppnews <- read.csv("Ko_JanAppnews")
# 
# Ko_Appnews <- rbind(Ko_MayAppnews, Ko_AprAppnews, Ko_MarAppnews, Ko_FebAppnews, Ko_JanAppnews)
# sum(is.na(Ko_Appnews$time)) #QQ
# 
# #去掉含有NA值的欄位QQ
# Ko_Appnews <- Ko_Appnews %>% na.omit()
# 
# 
# #用strsplit將 報導） 後面的雜訊清掉
# cleancontent <- c()
# for( i in 1:length(Ko_Appnews$time)){
#   t <- strsplit(Ko_Appnews$time[i] %>% as.character() , "報導）")
#   t <- t[[1]][1]
#   cleancontent <- rbind(cleancontent, t)
#   print(i)
# }
# 
# cleancontent <- data.frame(cleancontent)
# 
# 
# library(tibble)
# library(dplyr)
# library(tidyr)
# library(data.table)
# #切割時間
# Ko_Appnews <- Ko_Appnews %>% separate(text, c("出版時間","ttime"),"：") 
# #將text的欄位切成出版時間和time兩欄欄
# Ko_Appnews <- Ko_Appnews %>% separate(ttime, c("ttime","stime")," ") 
# Ko_Appnews <- Ko_Appnews %>% separate(ttime, c("year","month", "day"),"/") 
# Ko_Appnews <- cbind(Ko_Appnews$title, Ko_Appnews$year, Ko_Appnews$month, Ko_Appnews$day, cleancontent)
# 
# colnames(Ko_Appnews) <- c("title", "year", "month", "day", "content")
# 
# #增加Media的欄位
# Media <- c()
# text <- c("Apple")
# for( i in 1:length(Ko_Appnews$content)){
#   Media <- rbind(Media, text)
# }
# 
# Ko_Appnews <- cbind(Media, Ko_Appnews)
# 
# write.csv(Ko_Appnews, "Ko_Appnews")



#Bind上其他媒體的新聞
#打開蘋果、中時的柯新聞
Ko_Appnews <- read.csv("Appnews/Ko_Appnews")
Ko_CTnews <- read.csv("CTnews/Ko_CTnews")

#幫中時的媒體欄位改名
#增加Media的欄位
Media <- c()
text <- c("CT")
for( i in 1:length(Ko_CTnews$content)){
  Media <- rbind(Media, text)
}

#將中時的媒體欄位值換成另一欄
Ko_CTnews$Media <- Media

library(magrittr)
Ko_CTnews <- Ko_CTnews[ , 2:7] %>% data.frame()
Ko_Appnews <- Ko_Appnews[, 2:7] %>% data.frame()

#bind中時和蘋果的新聞
#用rbind會出現 Error in rownames(value[[jj]])[ri] <- rownames(xij) : 置換的長度為零
#不知如何解決，所以用了dplyr的bind_rows
library(dplyr)
Ko_news <- bind_rows(Ko_CTnews, Ko_Appnews)

#存檔
write.csv(Ko,file="Ko_news.csv")

Ko = read.csv("Ko_news")
?write.csv






