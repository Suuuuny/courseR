install.packages("ggmap")
install.packages("plyr")
library(httr)
library(jsonlite)
library(ggplot2)
library(ggmap)
library(plyr) 
library(stringr)
options(stringsAsFactors = F)

url <- "https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=5"
df <- fromJSON(content(GET(url), "text"))
info <- df$showInfo
new.df <- data.frame(matrix(unlist(info), byrow=T, ncol= 8))
new.df <- new.df[ ,-1] 
new.df <- new.df[ ,-7]
new.df <- cbind(df$title, new.df)
View(new.df)
names(new.df) <- c("Band",
                   "Location",
                   "Place",
                   "OnSale",
                   "Price",
                   "Lat",
                   "Lng")
new.df$Lat<-as.numeric(new.df$Lat) 
new.df$Lng<-as.numeric(new.df$Lng) 


#map
map.df <- new.df[complete.cases(new.df[ , 6:7]), ]
map.df <- map.df[ , -(2:5)]
ggmap(get_googlemap(center = c(120.493515, 23.670),
                    zoom = 8,
                    maptype = 'roadmap')) +
  geom_point(data = map.df,
             aes(x = Lng, y = Lat),
             colour = "red",
             size = 3.5 ,
             alpha = 0.3 )

#Place
place.df <- data.frame(count(new.df, "Place"))
ggplot(data=place.df, aes(x=Place, y=freq , fill=Place) ,family = "NotoSansCJKtc-Light") +
  geom_bar(stat="identity")

#County
county.df <- c()
for( i in new.df$Location[1:104] ){
   print(i)
   county <-substr( i , 1, 3)
   county.df <- rbind(county.df, county)
}

county.df <- as.data.frame(county.df)



for( i in county.df$V1[1:105]){
  if ( i == "803" ){
    i <- "Kaohsiung"
  }
}


#Price
Price.df <- c()
for( i in new.df$Price[1:104] ){
  print(i)
  Price <-substr( i , -1, -3)
  Price.df <- rbind(Price.df, Price)
}




