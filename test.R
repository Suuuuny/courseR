#建立新聞連結df
library(rvest)
library(httr)
options(stringsAsFactors = F )

turl <- "http://news.ltn.com.tw/list/newspaper/politics/20180313"
tdoc <- read_html(turl)
css <- "body > div.content > section > div.whitecon.boxTitle > ul > li > a.ph"
node_li <- html_nodes(tdoc , css)
news_url <- html_attr(node_li, "href")

url <- "http://news.ltn.com.tw/list/newspaper/politics/"
url_t <- c()

for ( i in 20180313:20180315) {
  print(i)
  url<- paste0(url,i)
  doc <- read_html(url)
  css <- "body > div.content > section > div.whitecon.boxTitle > ul > li > a.pha"
  node_li <- html_nodes(doc , css)
  news_url <- html_attr(node_li, "href")
  url_t <- rbind(url_t, news_url)
  }

View(url_t)




url<- paste0(url,i)

for ( i in 20180313:20180315) {
  print(i)
  url<- paste0(url,i)
  doc <- read_html(url)
  css <- "body > div.content > section > div.whitecon.boxTitle > ul > li > a.pha"
  node_li <- html_nodes(doc , css)
  news_url <- html_attr(node_li, "href")
  
  css_title <- "#rightmain > ul.news.boxTitle.boxpadding.noP > li > a > p"
  css_time <-  "#rightmain > ul.news.boxTitle.boxpadding.noP > li > a > span"
  node_title <- html_nodes(doc, css_title)
  node_time <- html_nodes(doc, css_time)
  news_title <- html_text(node_title)
  news_time <- html_text(node_time)
  pagelink.df <- rbind(pagelink.df, 
                       "新聞"= news_title,
                       "發布時間"= news_time, 
                       "連結"=news_url)
}

doc <- read_html(url)


print(pagelink.df)

#爬每一頁的新聞

html_li <- "http://m.ltn.com.tw/breakingnews/politics/20180314"
doc <- read_html(html_li)

#取news link
css <- "#rightmain > ul.news.boxTitle.boxpadding.noP > li > a"
node_li <- html_nodes(doc , css)
news_url <- html_attr(node_li, "href")
news_url <- paste0("http://m.ltn.com.tw/" , news_url)
View(news_url)


#取news title ＆ time
css_title <- "#rightmain > ul.news.boxTitle.boxpadding.noP > li > a > p"
css_time <-  "#rightmain > ul.news.boxTitle.boxpadding.noP > li > a > span"
node_title <- html_nodes(doc, css_title)
node_time <- html_nodes(doc, css_time)
news_title <- html_text(node_title)
news_time <- html_text(node_time)
typeof(news_title)







建立新聞link

cur_date <- as.POSIXlt(Sys.Date())
as.POSIXct(strptime(cur_date, "%Y-%m-%d"))

cur_date <- as.character(cur_date)
gsub("[[:punct:]]", "", cur_date)






