# #=========載入套件
# library(bitops)
# library(httr)
# library(rvest)
# library(RCurl)
# library(XML)
# library(NLP)
# library(tm)
# library(tmcn)
# library(jiebaRD)
# library(jiebaR)
# library(dplyr)
# 
# setwd("C:/Users/Weber/Desktop/R/HW5/DATA")
# prefix = "https://www.ptt.cc/bbs/Gossiping/index"
# session = rvest::html_session(url = "https://www.ptt.cc/bbs/Gossiping/index.html")
# 
# form = session %>%
#   html_node("form") %>%
#   html_form()
# 
# session_redirected = rvest::submit_form(session = session, form = form )
# 
# session_redirected %>%
#   html_node("body") %>%
#   html_nodes(".title") %>%
#   html_text(trim=T)
# 
# #=====
# data <- list()
# title <- list()
# date <- list()
# 
# #=====
# for( i in c(39104 : 39105))
# {
#   tmp <- paste(i, '.html', sep='')
#   url <- paste(prefix, tmp, sep='')
#   html <- htmlParse(GET(url),encoding = "UTF-8")
#   title.list <- xpathSApply(html, "//div[@class='title']/a[@href]", xmlValue)
#   url.list <- xpathSApply(html, "//div[@class='title']/a[@href]", xmlAttrs)
#   date.list <- xpathSApply(html, "//div[@class='meta']/div[@class='date']", xmlValue)
#   data <- rbind(data, as.matrix(paste('www.ptt.cc', url.list, sep='')))
#   title <- rbind(title, as.matrix(title.list))
#   date <- rbind(date, as.matrix(date.list))
# }
# 
# 



library(rvest)
# 
url <- "https://www.ptt.cc/bbs/Gossiping/index.html"
# 
res <- GET(url, config = set_cookies("over18" = "1"))
res.string <- content(res , "text" , encoding = "utf8")
# 
doc <- read_html(res.string, encoding = "utf-8")
pre <- "https://www.ptt.cc"
path <- '//*[@id="main-container"]/div[2]/div/div[2]/a'
links <- html_attr(html_nodes(doc, xpath = path), "href")
title <- html_text(html_nodes(doc, xpath = path))
links <- paste0(pre, links)
links

//*[@id="main-container"]/div[2]/div/div[2]/a
#main-container > div.r-list-container.action-bar-margin.bbs-screen > div:nth-child(3) > div.title
