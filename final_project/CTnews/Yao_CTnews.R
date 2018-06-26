rm(list = ls())

library(devtools)
library(RSelenium)

getwd()
setwd("/Users/sunny/Documents/GitHub/courseR/final_project/CTnews")

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
keyword <- "姚文智"
SearchBox <- remDr$findElement(using='id', value='txtKeyword')
SearchBox$sendKeysToElement(list(keyword, key = 'enter'))

SearchBox <- remDr$findElement(using='id', value='ddlRange')
SearchBox$sendKeysToElement(list("最近 6 個月", key = 'enter'))

all_links <- c()

for( i in 1:20) {
  links <- remDr$findElements(using='class', value='NewsContetn')
  result <- lapply(links, function(e) { e$getElementAttribute("href") })
  all_links <- rbind(all_links, result)
  message(i)
  
  SearchBox <- remDr$findElement(using='id', value='ctl00_ContentPlaceHolder1_UCPage1_lbtnPageNext')
  SearchBox$clickElement()
}

Yao_CTlinks <- unlist(all_links)

getwd()
setwd("/Users/sunny/Documents/GitHub/courseR/final_project/CTnews")
write.csv(Yao_CTlinks, "Yao_CTlinks")

Yao_CTlinks <- read.csv("Yao_CTlinks")

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

Yao_CTnews <- data.frame()

for( i in 1:length(Yao_CTlinks$x)){
  print(i)
  output <- FindCTnews(Yao_CTlinks[i,2])
  Yao_CTnews <- rbind(Yao_CTnews, output)
  Sys.sleep(sample(1:5,1))
}  

Yao_CTnews <- cbind(Yao_CTnews, Yao_CTlinks$x)
colnames(Yao_CTnews)[4] <- "URL"

l <- sapply(colnames(Yao_CTnews), function(x) grep("報導", Yao_CTnews$content))
ll <- data.frame(l[ , 1])
colnames(ll)[1] <- "mergenum"

mergenum <- data.frame(c(1:200)) #要換數字
colnames(mergenum)[1] <- "mergenum"
Yao_CTnews <- cbind(Yao_CTnews, mergenum)

Yao_RCTnews <- merge(Yao_CTnews, ll)
Yao_RCTnews <- Yao_RCTnews[ , 2:5]

write.csv(Yao_RCTnews, "Yao_RCTnews") 

#關掉瀏覽器
remDr$quit()  

#待補
#1.內文要清掉報導兩個字與後面文字
#2.按照時間排序，留下2018/01/01~2018/05/31

Yao_RCTnews <- read.csv("Yao_RCTnews")

library(magrittr)
newtime <- c()
for(i in 1:length(Yao_RCTnews$time)){
   tt <- strsplit(Yao_RCTnews$time[i] %>% as.character(), "-")
   ttime <- matrix(unlist(tt), ncol = 2, byrow = T)
   newtime <- rbind(newtime, ttime)
   print(i)
}

newtime <- data.frame(newtime)
Yao_RCTnews <- cbind(Yao_RCTnews, newtime)

library(tm)
newcontent <- c()
for( n in 1:length(Yao_RCTnews$content)){
  docs <- Corpus(VectorSource(Yao_RCTnews$content[n]))
  toSpace <- content_transformer(function(x,pattern){
    return(gsub(pattern," ",x))
  })
    
  print(n)
    
    docs <- tm_map(docs,toSpace,"本新聞、圖片內容由--時報資訊股份有限公司--取得合法授權。除經本公司同意，本網站僅供您個人及非商業目的之使用。您不得修改、拷貝、散佈、傳送、展示、執行、授權、製作衍生著作、移轉或銷售取自於本網站之任何資料、軟體、產品或服務。")
    ncontent <- content(docs[1])
    newcontent <- rbind(newcontent, ncontent)
    
}


Yao_CTnews <- c()
title <- data.frame(Yao_RCTnews$title)
time <- data.frame(Yao_RCTnews$X1)
content <- data.frame(newcontent)
Yao_CTnews <- cbind(title, time, content)
colnames(Yao_CTnews) <- c("title", "time", "content")


write.csv(Yao_CTnews, "Yao_CTnews")

#要處理時間的排序，以及刪去0101-0531以外的文章ＱＱ

library(tibble)
library(dplyr)
library(tidyr)
library(data.table)

Yao_CTnews <- Yao_CTnews %>% separate(time, c("year","month","day"),"/") #將time的欄位切成年月日三欄
Yao_CTnews <- Yao_CTnews[with(Yao_CTnews, order(year, month, day )), ]
Yao_CTnews <- Yao_CTnews[13:139 ,]
Yao_CTnews <- Yao_CTnews[1:107,]


write.csv(Yao_CTnews, "Yao_CTnews")

#Yao_CTnews <- read.csv("Yao_CTnews")
#Yao_CTnews <- Yao_CTnews[ ,2:6 ]

Media <- c()
text <- c("Apple")
for( i in 1:length(Yao_CTnews$content)){
  Media <- rbind(Media, text)
}

Yao_CTnews <- cbind(Media, Yao_CTnews)

write.csv(Yao_CTnews, "Yao_CTnews")



