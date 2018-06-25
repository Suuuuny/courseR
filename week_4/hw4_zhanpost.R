par(family=("Heiti TC Light"))

library(httr)
library(jsonlite)
library(plyr)
library(jiebaR)
library(tidyverse)
options(stringsAsFactors = F)

# furl <- 
#  "https://graph.facebook.com/v2.12/thomas0126?fields=posts.limit(20)&access_token=EAACEdEose0cBAJ5Mt8xCPB7BF15927YjhHNV41iL1T7bXuiiv0Nu0VhrcZAd3rBoyujDdJD7i6B74FRlmuM7m3CvXpZCaR67t2mNvrOpY36HSm6INFAHWW5nCdWZABZAZCsiIAThOvpXny9XsU5e0TyVso5kAavZAjOkhJe2d4m60DWwaakG2YbkDsEC9eZCZCMZD"
# 
# zhan.post <- fromJSON(content(GET(furl), "text"))
# zhan.df <- as.data.frame(zhan.post$posts$data)
# next.link <- zhan.post$posts$paging$"next"
# links <- c()
# links <- rbind(links, next.link)
# next.post <- fromJSON(content(GET(next.link), "text"))
# zhan.df <- rbind(zhan.df, next.post$data)
# 
# for( i in 1:3){
#   print(i)
#   more.link <- next.post$paging$"next"
#   links <- rbind(links, more.link)
#   next.post <- fromJSON(content(GET(more.link), "text"))
#   zhan.df <- rbind.fill(zhan.df, as.data.frame(next.post$data))
#   
# }
# 
# #測試有無抓到重複的
# unique(zhan.df$created_time)
# #去掉非2018年的資料
# tail(zhan.df$created_time)
# zhan.df <- zhan.df[1:98,]
# 
# #存檔
# saveRDS(zhan.df, "fbpost_zhan.rds")
zhan.df <- readRDS("fbpost_zhan.rds")
zhan.post<- zhan.df$message

View(zhan.post)

#要做文字雲用的套件
library(NLP)
library(tm)
library(jiebaRD)
library(jiebaR)
library(RColorBrewer)
install.packages("wordcloud")
library(wordcloud)

#要清洗掉的東西
docs <- Corpus(VectorSource(zhan.post))

#定義清洗：清洗就是把你找到的符號用空白取代
toSpace <- content_transformer(function(x, pattern) {
  return (gsub(pattern, " ", x))
})

docs <- tm_map(docs,toSpace,"V1")
docs <- tm_map(docs,toSpace,"\n")
docs <- tm_map(docs,toSpace, "1")
docs <- tm_map(docs,toSpace, "的")
docs <- tm_map(docs,toSpace, "及")
docs <- tm_map(docs,toSpace, "為")
docs <- tm_map(docs,toSpace, "是")
docs <- tm_map(docs,toSpace, "在")
docs <- tm_map(docs,toSpace, "才")
docs <- tm_map(docs,toSpace, "所以")
docs <- tm_map(docs,toSpace, "是否")
docs <- tm_map(docs,toSpace, "再")
docs <- tm_map(docs,toSpace, "與")
docs <- tm_map(docs,toSpace, "等")
docs <- tm_map(docs,toSpace, "這")
docs <- tm_map(docs,toSpace, "或")
docs <- tm_map(docs,toSpace, "但")
docs <- tm_map(docs,toSpace, "就")
docs <- tm_map(docs,toSpace, "也")
docs <- tm_map(docs,toSpace, "了")
docs <- tm_map(docs,toSpace, "之")
docs <- tm_map(docs,toSpace, "[A-Za-z0-9]")
docs <- tm_map(docs,toSpace, "，")
docs <- tm_map(docs,toSpace, "。")
docs <- tm_map(docs,toSpace, "？")
docs <- tm_map(docs,toSpace, "！")
docs <- tm_map(docs,toSpace, "：")
docs <- tm_map(docs, removeNumbers) #remove numbers
docs <- tm_map(docs, stripWhitespace)#清除空格
docs <- tm_map(docs, removePunctuation) #removePunctuation移除的是半形標點符號

#斷詞
mixseg = worker()
segment <- c("阿貴","深澳","瑞芳","環差","新北","台北")
new_user_word(mixseg, segment)

#有詞頻之後就可以去畫文字雲
jieba_tokenizer=function(d){
  unlist(segment(d[[1]],mixseg))
}
seg = lapply(docs, jieba_tokenizer)
freqFrame = as.data.frame(table(unlist(seg)))

#畫出文字雲
wordcloud(freqFrame$Var1,freqFrame$Freq,
          min.freq=10,
          random.order=TRUE,random.color=TRUE, 
          rot.per=.1, colors=rainbow(length(row.names(freqFrame))),
          ordered.colors=FALSE,use.r.layout=FALSE,
          fixed.asp=TRUE, vertex.label.family= "Heiti TC Light")




