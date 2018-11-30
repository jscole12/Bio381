# sunburst
# November 29 2018
# EAS

# sunburst is a great way to summarize and view observational data not based on numbers but letters and words

# it tracks and graphs patterns in an interactive graph

library(ggplot2)
library(sunburstR)
library(magrittr)
library(dplyr)


data <- read.csv("sunburstData.csv",'header'=TRUE, 'colClasses' = c('integer','character'))

head(data)
typeof(data)


action <- data %>%
  group_by(Time_tag) %>%
  #filter(row_number()==1) %>%
  #ungroup() %>%
  summarize(Response=paste(c(Response),collapse="="))
# results in length 1 character vector

sequences <- action %>%
  ungroup() %>%
  group_by(Response) %>%
  summarize(count=n())

sequences$depth <- unlist(lapply(strsplit(sequences$Response,"="),length))

# lapply returns a list of the same lenght of x, so we worked with out times before, now we are workign with our responses
# str split splits the elements of our character vector into substrings

sb <- sequences %>%
  arrange(desc(depth),Response) %>%
  sunburst(count=TRUE)
print(sb)

# the 8 in the center meanst there are different combinations of observations in out data

# for example, in the upper right of the sunbrust with the sequence of absent, bottom and dead, 1 of 8 or 12.5% of the combinations in my data have these three elements
