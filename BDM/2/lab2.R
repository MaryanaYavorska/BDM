library (dplyr) 
library (ggplot2)
movie_body_counts <- read.csv ( 'filmdeathcounts.csv')
head(movie_body_counts)
str(movie_body_counts)	
movie_body_counts$body_per_min <- movie_body_counts$Body_Count/movie_body_counts$Length_Minutes
ggplot(movie_body_counts, aes(x=Body_Count)) + geom_histogram(bins=20, color="darkred", fill="lightyellow")
movie_body_counts %>%
  top_n(n = 10, Body_Count) %>% arrange(desc(Body_Count))
movie_body_counts %>%
  top_n(n = 10, body_per_min) %>% arrange(desc(body_per_min))
ggplot(movie_body_counts, aes(x=IMDB_Rating)) + geom_histogram(bins=10, color="black", fill="purple")




