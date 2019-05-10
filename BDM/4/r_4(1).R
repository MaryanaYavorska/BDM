#install.packages("dplyr")

#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)
setwd("D:/R")
m1 <- read.csv("mushroom.csv", header= FALSE, sep=",")
m2 <- m1[,c("V1","V4", "V22", "V23")]
colnames(m2) <- c("class", "color", "population","habitat")
lu<-read.csv("mushroom.csv", sep=",")
lu$concat <- do.call(paste, c(lu[c("column", "code")], sep = "")) 
m2$concat_class <- paste("class",m2$class)
m2$concat_color <- paste("color",m2$color)
m2$concat_population <- paste("population",m2$population)
m2$concat_habitat <- paste("habitat",m2$habitat)
head (m2)
lu = setNames(lu,c('column','code','change', 'concat_class'))
m3=merge(m2,lu,by="concat_class")

lu = setNames(lu,c('column','code','change', 'concat_color'))
m4=merge(m3,lu,by="concat_color")

lu = setNames(lu,c('column','code','change', 'concat_population'))
m5=merge(m4,lu,by="concat_population")

lu = setNames(lu,c('column','code','change', 'concat_habitat'))
m6=merge(m5,lu,by="concat_habitat")

m6 = setNames(m6,c('n','n','n','n','n','n','n','n','n','n','class','n','n','color','n','n','population','n','n','habitat'))
m7<-subset(m6, select=c(class, color, population, habitat ))


