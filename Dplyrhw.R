# September 26, 2018
## JSC

library(dplyr)
data(iris)


glimpse(iris)

str(iris)
head(iris)
tail(iris)

# Question 1: 
# 150 observations
# 5 variables

## Question 2
#100 Observations
# 3 variables
iris1 <- filter(iris, Species %in% c("virginica","versicolor", Sepal.Length < 6, Sepal.Width > 2.5))
glimpse(iris1)
head(iris1)        
tail(iris1)

## Question 3
# 100 Observations
#  3 Variables
iris2 <- select(iris1, Species, Sepal.Length, Sepal.Width) 
glimpse(iris2)
head(iris2)
tail(iris2)

## Question 4
iris3 <- arrange(iris2, desc(Sepal.Length))
head(iris3)

## Question 5
# 100 Observations 
# 4 variables
iris4 <- mutate(iris3, ratio = Sepal.Length*Sepal.Width)
glimpse(iris4)


## Question 6
iris5 <- summarize(iris4, meanSepal.Length = mean(Sepal.Length), meanSepal.Width = mean(Sepal.Width), n())
print(iris5)

## Question 7
iris6 <- group_by(iris4, Species)
  summarize(iris4, meanSepal.Length = mean(Sepal.Length), meanSepal.Width = mean(Sepal.Width), n())
print(iris6)


      