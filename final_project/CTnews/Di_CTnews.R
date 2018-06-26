rm(list = ls())

library(devtools)
library(RSelenium)

getwd()

# 連接 Selenium 伺服器，選用 chrome 瀏覽器
remDr <- remoteDriver(
  remoteServerAddr = "localhost",
  port = 4444,
  browserName = "chrome")

# 開啟瀏覽器
remDr$open()

#開啟知識贏家的網頁
remDr$navigate("http://kmw.chinatimes.com/News/NewsSearch.aspx?searchkind=s")

# 依據 CSS 選擇器取得網頁元素
login <- remDr$findElement(using = 'id', value = "lbInfotimesLogin")
login$clickElement()
keyword <- "丁守中"
SearchBox <- remDr$findElement(using='id', value='txtKeyword')
SearchBox$sendKeysToElement(list(keyword, key = 'enter'))

SearchBox <- remDr$findElement(using='id', value='ddlRange')
SearchBox$sendKeysToElement(list("最近 6 個月", key = 'enter'))

all_links <- c()

for( i in 1:22) {
  links <- remDr$findElements(using='class', value='NewsContetn')
  result <- lapply(links, function(e) { e$getElementAttribute("href") })
  all_links <- rbind(all_links, result)
  message(i)
  
  SearchBox <- remDr$findElement(using='id', value='ctl00_ContentPlaceHolder1_UCPage1_lbtnPageNext')
  SearchBox$clickElement()
}

Ding_CTlinks <- unlist(all_links)

getwd()
setwd("/Users/sunny/Documents/GitHub/courseR/final_project/CTnews")
write.csv(Ding_CTlinks, "Ding_CTlinks")

Ding_CTlinks <- read.csv("Ding_CTlinks")

FindCTnews <- function(URL){
  remDr$navigate(URL)
  title_list <- remDr$findElement(using = 'css selector', value = "#aspnetForm > div.page_container.clear-fix > article > header > span > h1")
  title <- unlist(title_list$getElementText())
  
  content_list <- remDr$findElement(using = 'css selector', value = "#dvContainer")
  content <- unlist(content_list$getElementText())
  
  time_list <- remDr$findElement(using = 'css selector', value = "#ctl00_ContentPlaceHolder1_UCNewsContent1_lbldateAuth")
  time <- unlist(time_list$getElementText())
  
  output <- cbind(title, time, content)
  
  return(output)
}

Ding_CTnews <- data.frame()

for( i in 1:length(Ding_CTlinks$x)){
  print(i)
  output <- FindCTnews(Ding_CTlinks[i,2])
  Ding_CTnews <- rbind(Ding_CTnews, output)
  Sys.sleep(sample(1:5,1))
}  

Ding_CTnews <- cbind(Ding_CTnews, Ding_CTlinks$x)
colnames(Ding_CTnews)[4] <- "URL"

l <- sapply(colnames(Ding_CTnews), function(x) grep("報導", Ding_CTnews$content))
ll <- data.frame(l[ , 1])
colnames(ll)[1] <- "mergenum"

mergenum <- data.frame(c(1:220)) #要換數字
colnames(mergenum)[1] <- "mergenum"
Ding_CTnews <- cbind(Ding_CTnews, mergenum)

Ding_RCTnews <- merge(Ding_CTnews, ll)
Ding_RCTnews <- Ding_RCTnews[ , 2:5]

write.csv(Ding_RCTnews, "Ding_RCTnews") 

#關掉瀏覽器
remDr$quit()  

#待補
#1.內文要清掉報導兩個字與後面文字
#2.按照時間排序，留下2018/01/01~2018/05/31

Ding_RCTnews <- read.csv("Ding_RCTnews")

library(magrittr)
newtime <- c()
for(i in 1:length(Ding_RCTnews$time)){
  tt <- strsplit(Ding_RCTnews$time[i] %>% as.character(), "-")
  ttime <- matrix(unlist(tt), ncol = 2, byrow = T)
  newtime <- rbind(newtime, ttime)
  print(i)
}

newtime <- data.frame(newtime)
Ding_RCTnews <- cbind(Ding_RCTnews, newtime)

library(tm)
newcontent <- c()
for( n in 1:length(Ding_RCTnews$content)){
  docs <- Corpus(VectorSource(Ding_RCTnews$content[n]))
  toSpace <- content_transformer(function(x,pattern){
    return(gsub(pattern," ",x))
  })
  
  print(n)
  
  docs <- tm_map(docs,toSpace,"本新聞、圖片內容由--時報資訊股份有限公司--取得合法授權。除經本公司同意，本網站僅供您個人及非商業目的之使用。您不得修改、拷貝、散佈、傳送、展示、執行、授權、製作衍生著作、移轉或銷售取自於本網站之任何資料、軟體、產品或服務。")
  ncontent <- content(docs[1])
  newcontent <- rbind(newcontent, ncontent)
  
}


Ding_CTnews <- c()
title <- data.frame(Ding_RCTnews$title)
time <- data.frame(Ding_RCTnews$X1)
content <- data.frame(newcontent)
Ding_CTnews <- cbind(title, time, content)
colnames(Ding_CTnews) <- c("title", "time", "content")


write.csv(Ding_CTnews, "Ding_CTnews")

#要處理時間的排序，以及刪去0101-0531以外的文章ＱＱ

library(tibble)
library(dplyr)
library(tidyr)
library(data.table)

Ding_CTnews <- Ding_CTnews %>% separate(time, c("year","month","day"),"/") #將time的欄位切成年月日三欄
Ding_CTnews <- Ding_CTnews[with(Ding_CTnews, order(year, month, day )), ]
Ding_CTnews <- Ding_CTnews[10:147, ]
Ding_CTnews <- Ding_CTnews[1:113, ]

#Ding_CTnews <- read.csv("Ding_CTnews")
#Ding_CTnews <- Ding_CTnews[ ,2:6 ]

Media <- c()
text <- c("Apple")
for( i in 1:length(Ding_CTnews$content)){
  Media <- rbind(Media, text)
}

Ding_CTnews <- cbind(Media, Ding_CTnews)

write.csv(Ding_CTnews, "Ding_CTnews")





