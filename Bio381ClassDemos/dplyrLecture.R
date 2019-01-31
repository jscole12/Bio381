### manipulating data using dplr
#September 25,208

# Start with built in data set
library(dplyr)
data(starwars)
class(starwars)

# str(starwars)
glimpse(starwars) # better than str() in this case
head(starwars)

## Clean up our data
# complete.cases base R
starwarsClean <- starwars[complete.cases(starwars[1:10]),]
head(starwarsClean)
glimpse(starwarsClean)

# Check for Nas
is.na(starwarsClean[1,1])
anyNA(starwarsClean)
anyNA(starwars[1:10])

#### filter(): pick/subset observations based on their values
### uses > >= < <= != ==
### logical operators & | !

filter(starwarsClean, gender == "male"&  height < 180)
filter(starwarsClean, eye_color %in% c("blue","brown"))
## excludes NAs (unles you ask for them), but other rows can include NAs
filter(starwarsClean, gender == "male", height <180, height > 100) # you can add multiple conditions

### arrange(): reorders rows
arrange(starwarsClean, height)
arrange(starwarsClean, desc(height))

# break ties by putting more columns
arrange(starwarsClean, height, desc(mass))
starwars1 <- arrange(starwars, height)
tail(starwars1)

## select(): choose variables by their name
glimpse(starwarsClean)
starwarsClean[1:10,]
select(starwarsClean, 1:10)
select(starwarsClean, name:species)
select(starwarsClean, -(c(name,skin_color)))

### moving clomuns around using select
select(starwarsClean, name, gender, species, everything()) # Reoder data set
select(starwarsClean, contains("color")) # helper function
# other helper functions: ends_with, starts_with, matches(regular expresions) num_range

## rename columns with select
select(starwars, haircolor = hair_color)
rename(starwarsClean, haircolor = hair_color) # use this to keep other data

### mutate(): create new variables with functions of existing variables
starwarsClean<-mutate(starwarsClean, ratio = height/mass) # arithmetic operators 
head(starwarsClean$ratio)

glimpse(starwarsClean)
starwars_pounds<-mutate(starwarsClean, mass_lbs = mass * 2.2)
head(starwars_pounds)

select(starwars_pounds, name:mass, mass_lbs, everything())
transmute(starwarsClean, mass_lbs=mass*2.2) # only returns new variable

#### summarize() and group_by()
summarize(starwarsClean, meanHeight = mean(height))

#### group_by for more usefulness
starwarsGenders <- group_by(starwars, gender)
summarize(starwarsGenders, meanHeight = mean(height, na.rm = TRUE), number = n()) # n() returns sample size

#### Summarize groups via pipe 
starwarsClean %>%
  group_by(gender) %>%
  summarize(meanHeight = mean(height), TotalNumber = n())
