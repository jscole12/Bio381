library(dplyr)
data(starwars)

starwars1 <- select(starwars, name:species) # create a new csv file with our R object
write.table(starwars1, file = "StarwarsNamesInfo.csv", row.names = F, sep = ",") # creating a csv with write.table()

#### read.table(): useful when you have metadata
data <- read.table(file="FileName.csv", row.names= 1, header = TRUE, sep=",", stringsAsFactors = FALSE) ### general format

data <- read.table("StarwarsNamesInfo.csv", header = T, sep = ",", stringsAsFactors =  F) # our dataset has a header and the character variables are not factors
head(data) # metadata doesn't show up # use comment.char = "#" if you use read.csv()
class(data)

data <- as_tibble(data)
glimpse(data)

# saveRDS(): usefull when working in R; saves a single R object as a file
saveRDS(starwars1, file = "StarwarsTibble")

## readRDS(): restores R object
sw <- readRDS("StarwarsTibble")
class(sw)

### Further into dyplyr
### Counts
glimpse(sw)

### count our NAs (not in dyplyr)
sum(is.na(sw))
#### count our nonmissing data
sum(!is.na(sw))

swSp <- sw %>%
    group_by(species) %>%
    arrange(desc(mass))
swSp

# determine samples size
swSp %>%
  summarize(avgMass = mean(mass, na.rm=T),avgHeight = mean(height, na.rm = T), n=n()) ## n() gives count info (sample size)

## filter out low sample size
swSp %>%
  summarize(avgMass = mean(mass, na.rm=T),avgHeight = mean(height, na.rm = T), n=n()) %>% 
  filter(n >= 2)

# put in descending order
swSp %>%
  summarise(avgMass = mean(mass, na.rm=T), avgHeight=mean(height, na.rm=T), n=n()) %>%
  filter(n >=2) %>%
arrange(desc(n))


### using count helper
swSp %>% 
  count(eye_color) # gives number of individuals with a given eye color (already grouped by species)

swSp %>%
  count(wt = height) # gives the sum using "weight" (wt)


#### Useful summary functions 
starwarsSummary <- swSp%>%
  summarize(avgHeight=mean(height,na.rm=T), medHeight = median(height, na.rm=T), height_sd=sd(height, na.rm=T), height_IQR=IQR(height, na.rm=T),min_height=min(height, na.rm=T), first_height=first(height), n=n(),n_eyecolor = n_distinct(eye_color)) %>%
  filter(n >= 2) %>%
  arrange(desc(n))

starwarsSummary

### group_by() use multiple variables/ungroup
# clean up
sw2 <- sw[complete.cases(sw),]
glimpse(sw2)

sw2groups <- group_by(sw2, species, hair_color)
summarize(sw2groups, n=n())

sw3groups <- group_by(sw2, species, hair_color, gender)
summarize(sw3groups, n=n())

# ungrouping
sw3groups %>% 
  ungroup() %>%
  summarize(n=n())

# ungroup(sw3groups)

## Grouping with mutate
### Ex: standardize within groups
sw3 <- sw2 %>%
  group_by(species) %>%
  mutate(prop_height = height/sum(height)) %>%
  select(species,height, prop_height)
sw3

sw3 %>%
  arrange(species) # alphabetical order

library(sp)
sp::coordinates(data) ## for using specific









