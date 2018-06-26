library(httr)
library(devtools)
install.packages("DMwR")
library(DMwR)
library(nnet)
install.packages("reshape")
library(reshape)
library(scales)
library(ggplot2)
install.packages("NeuralNetTools")
library(NeuralNetTools)

rm(list = ls())

wine <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data" , header = T)
str(wine)

colnames(wine) <- c("class", "Alcohol", "Malic acid", "Ash", "Alcalinity of ash", "Magnesium", "Total phenols", "Flavanoids", "Nonflavanoid phenols", "Proanthocyanins", "Color intensity", "Hue", "OD280/OD315 of diluted wines", "Proline")

n <- nrow(wine)
t_size = round(0.7 * n)
t_idx <- sample(seq_len(n), size = t_size)
traindata <- wine[t_idx,]
testdata <- wine[ - t_idx,]

nnetM <- nnet(formula = class ~ ., linout = T, size = 3, decay = 0.001, maxit = 1000, trace = T, data = traindata)

NeuralNetTools::plotnet(nnetM, wts.only = F)

#預測
prediction <- predict(nnetM, testdata, type = 'raw')

cm <- table(x = testdata$class, y = prediction, dnn = c("實際", "預測"))
cm 

