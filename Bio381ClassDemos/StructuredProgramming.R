# Example of structured programming approach
# 16 october 2018
# JSC
#-----------------------------
#Preliminaries
library(ggplot2)
source("myFunctions.R")
# set.seed(100)
#----------------------------
# Global variables
antFile <- "antcountydata.csv" # ant data set
xCol <- 7 # latitude center of each county
yCol <- 5 # number of ant species
#-------------------

# Program body

temp1 <- getData(filename=antFile)

x <- temp1[,xCol] # extract predictor variable
y <- temp1[,yCol] # extract response variable

temp2 <- fitRegressionModel(xVar=x,yVar=y) # fit regression model
temp3 <- summarizeoutput(temp2)

graphResults(xVar=x,yVar=y)

print(temp3) # show residuals
print(temp2) # show model summary




getData()
calculateStuff()
summarizeoutput()
graphResults()

