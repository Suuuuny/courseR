library(httr)
library(jsonlite)
library(plyr)
library(jiebaR)
library(tidyverse)
options(stringsAsFactors = F)

furl <- 
 "https://graph.facebook.com/v2.12/thomas0126?fields=posts&access_token=EAACEdEose0cBABsKLZAM2Cibnau4EJvwBZC8hdF1sJNUjaH7TVA0Kh5DDBntfl11k6cqy9SRXA70HNt6QchlKxrk65mKpUfjlTbVrJYNloe2zNy5u6tIZCsBDgjnCg78ogJMWBEu7uBqwoJRHXYlP7JihM7lkMNZC6uJmacumZCskaw57QJz2ptVg3cpWgXgZD"

zhan.post <- fromJSON(content(GET(furl), "text"))
zhan.df <- as.data.frame(zhan.post$posts$data)
next.link <- zhan.post$posts$paging$"next"
links <- c()
links <- rbind(links, next.link)
next.post <- fromJSON(content(GET(next.link), "text"))
zhan.df <- rbind(zhan.df, next.post$data)


for( i in 1:20){
  print(i)
  more.link <- next.post$paging$"next"
  links <- rbind(links, more.link)
  next.post <- fromJSON(content(GET(more.link), "text"))
  zhan.df <- rbind.fill(zhan.df, as.data.frame(next.post$data))
  
}

unique(zhan.df$created_time)

#斷zhan.df的詞
cutter <- worker()
cutted.df <- segment(zhan.df$message[1] , cutter)
cutted.df1 <- segment(zhan.df$message[2] , cutter)

tdm <- TermDocumentMatrix(d.corpus, control = list(wordLengths = c(1,1)))
inspect(tdm)

tf <- apply(tdm, 2, sum) # term frequency
idf <- function(word_doc){ log2( (length(word_doc)+1) / nnzero(word_doc) ) }
idf <- apply(tdm, 1, idf)
doc.tfidf <- as.matrix(tdm)
for(i in 1:nrow(tdm)){
  for(j in 1:ncol(tdm)){
    doc.tfidf[i,j] <- (doc.tfidf[i,j] / tf[j]) * idf[i]
  }
}





