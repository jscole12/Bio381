# Explain what the heck this script is. What is it doing, what project is it associated with? Give as many details as possible so that you will understand later on what this is from!

# 6 September 2018
# JSC
#--------------------------
# Preliminaries
library(ggplot2)
#set.seed(100)
library(TeachingDemos)
#char2seed(x="green tea")

# Global variables
nRep <- 10000 #number of values

#Create or read in data
ranVar1 <- rnorm(n=nRep)
# print(ranVar1)

# Peak at data
head(ranVar1)
tail(ranVar1)
length(ranVar1)
str(ranVar1)

#Create second variable
ranVar2 <- rnorm(nRep)

#visualize data
qplot(x=ranVar2)
qplot(x=ranVar2,
      color=I("black"),
      fill=I("goldenrod"))

