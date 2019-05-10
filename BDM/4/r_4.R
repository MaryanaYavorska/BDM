#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)
df<-read.csv("http://vincentarelbundock.github.io/Rdatasets/csv/plm/Produc.csv", header= TRUE, sep=",")
options(warn=-1)
df$priv_over_pub <- with(df, pc / gsp)
df_sub<-subset(df, select=c(state, year, unemp,priv_over_pub))
ggplot(data=df_sub, aes(x=priv_over_pub, y=state, col=year)) + geom_point()
min_vals <-aggregate(priv_over_pub ~ state, df_sub, function(x) min(x))
max_vals <-aggregate(priv_over_pub ~ state, df_sub, function(x) max(x))
names(min_vals)[1:2]<-c("state","min")
names(max_vals)[1:2]<-c("state","max")
maxmin=merge(min_vals,max_vals,by='state')
maxmin$range <- (maxmin$max-maxmin$min)
maxmin[order(maxmin$range),]
po=maxmin
all<-po[order(maxmin$range),]
lowest<-head(all,5)
lowest
highest<-tail(all,5)
highest
low=merge(lowest,df_sub,by='state')
low
highe=merge(highest,df,by='state')
highe
ggplot(low, aes(x=unemp, y=year, col=state)) + geom_point()+ geom_smooth(se=FALSE) 
ggplot(highe, aes(x=unemp, y=year, col=state)) + geom_point()+ geom_smooth(se=FALSE) 

