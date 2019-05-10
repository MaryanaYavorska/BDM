#install.packages("dplyr")

#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)
setwd("D:/R")
flats <- read.csv("flats.csv", stringsAsFactors=FALSE)
class(flats)
str(flats)
flats <- read.csv ( "flats.csv", stringsAsFactors = FALSE, dec = ",")
head (flats, 15)
tail(flats, 6)
dim (flats)
names (flats) 
count(flats, Square)
str(flats)
flats %>%
  filter(Room == 1) %>%
  filter(City == "Lviv") %>% 
  summarise(mean(Square))
flats %>%
       filter(Room == 2) %>%
       filter(City == "Lviv") %>% 
       summarise(mean=median(Square))


library(ggplot2)
ggplot(flats, aes(x=Price, y= Room)) +
  geom_point()

ggplot(flats, aes(x=Square, y= Price)) +  geom_boxplot() +  coord_flip()
scale_x_reverse()
df <- data.frame(x = 1:5, y = (1:5) ^ 2)
ggplot(df, aes(x, y)) +
  geom_area()
qplot(Room, Price, data=flats, geom="boxplot")


ggplot(flats, aes(x=Price)) +
  
  geom_histogram(breaks=seq(0, 12250001, by = 5000),
                 fill="lightyellow",
                 
                 col="grey") +ylab('Number')
max(flats$Price, na.rm = TRUE)

