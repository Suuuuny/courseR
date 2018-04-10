library(rvest)
library(httr)
library(jsonlite)
library(tidyverse)
options(stringsAsFactors = F )

#1.pttbg_crawler 
#1.1 pttweblinks_crawler
p.url <- "https://www.ptt.cc/bbs/Boy-Girl/index.html"
p.doc <- read_html(p.url)
p.css <- "#action-bar-container > div > div.btn-group.btn-group-paging > a:nth-child(2)"
p.node <- html_node(p.doc, p.css)
p.lastlink <- html_attr(p.node, "href")
p.lastnum <- gsub(".*index([0-9]+).html", "\\1", p.lastlink)
p.lastnum <- as.numeric(p.lastnum) + 1


all.links <- c()
for ( p in 3873:p.lastnum ) {
  print(p) 
  p.url1 <- sprintf("https://www.ptt.cc/bbs/Boy-Girl/index%s.html", p)
  p.doc1 <- read_html(p.url1)
  p.css1 <- "#main-container > div.r-list-container.action-bar-margin.bbs-screen > div > div.title > a"
  p.node1 <- html_nodes(p.doc1, p.css1)
  p.links1 <- html_attr(p.node1, "href")
  pre <- paste0("https://www.ptt.cc/" , p.links1)
  all.links <- c(all.links, pre)
  Sys.sleep(sample(0:10, 1))
}

print(all.links)

#1.2 pttpost_crawler
pp.df <- c()

for( i in all.links[1:342]){
  print(i)
  pp.doc <- read_html(i)
  meta.css <- "#main-content > div.article-metaline > span.article-meta-value"
  meta.node <- html_nodes(pp.doc, meta.css)
  meta.text <- html_text(meta.node, "span")
  post.css <-  "#main-content"
  post.node <- html_nodes(pp.doc, post.css)
  post.text <- html_text(post.node)
  p1.df <- data.frame( Author = meta.text[1], 
                       Title = meta.text[2],
                       Time = meta.text[3],
                       Post = post.text,
                       Url = i)
  pp.df <- rbind(pp.df, p1.df)
  
  Sys.sleep(sample(0:10, 1))
}

saveRDS(pp.df, "ppt0402_0409.rds")
ppost.df <- readRDS("ppt0402_0409.rds")
holiday.post.df <- ppost.df[33:277, ]

#1.3 change the Time column
week.df <- c()
hour.df <- c()
for( m in holiday.post.df$Time[1:245] ){
  print(m)
  weekday  <- substr( m , start = 1 , stop = 3)
  hour <- substr(m, start = 12 , stop = 13 )
  week.df <- rbind(week.df, weekday)
  hour.df <- rbind(hour.df, hour)
}

#轉換為df，畫圖

#text.mining 斷詞
post.text <- c() 
for(post in holiday.post.df$Post) {
  tryCatch({
    start = regexpr("2018", post)[1] + 5
    end = regexpr("※ 發信站: 批踢踢", post)[1] - 1
    new.text <- substr(post, start, end)
    post.text <- rbind(post.text, new.text)
  }, error = function(e) {
    
  })
}

library("jiebaR")
Sys.setlocale(category = "LC_ALL", locale = "cht")
cc = worker()
ss = cc[post.text]
sss = cc[post.text[1:10]]

count_table <-table(ss)
counter <- 1
for(freq in count_table) {
  count_table[counter] = log(freq+1)
  counter = counter + 1
}

ctt = table(sss)
ctt = data.frame(ctt)
for(i in c(1:nrow(ctt))) {
  count_table[as.character(ctt[i,][1])] = count_table[as.numeric(ctt[i,][2])] / ctt[i,][2]
}
count_table <- data.frame(count_table)

install.packages("wordcloud2")
library(wordcloud2)
wordcloud2(count_table)

#比較4/2-4/7哪天最多人發文
#發文時間的分佈













