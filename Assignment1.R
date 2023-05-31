library(tidyverse)
library(rvest)

#quesa

html <- read_html(" https://www.moneyworks4me.com/best-index/nse-stocks/top-nifty50-companies-list/")
table <- html %>% html_table(fill= TRUE)
  first_table <- table[[1]]
  first_table <- first_table[,-1]
  first_table <- first_table[,-13]
  dataset <- first_table[,-13]
 
 #quese

page <- read_html("https://editorial.rottentomatoes.com/guide/best-netflix-movies-to-watch-right-now/")
Ranking <- page %>% html_elements(".countdown-index") %>% html_text()
Name_of_movies <- page %>% html_elements(".article_movie_title a") %>% html_text()
tomato_score <- page %>% html_elements(".tMeterScore") %>% html_text()
Year_of_movies <- page %>% html_elements(".start-year") %>% html_text()
Movie_dataset <- data.frame("Ranking"= Ranking,"Name of Movies"= Name_of_movies,"Tomato % score"= tomato_score,"Year of Movie"= Year_of_movies)

