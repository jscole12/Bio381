---
  title: "Organizing Code with Structured Programming"
author: "Jessica Cole"
date: "October 17, 2018"
output: html_document
---
  
  ```{r}
##############
# FUNCTION: Put data into data frame
# INPUTS: file name with specified independent and dependent variables
# OUTPUTS: Data frame
#----------------
getDatawithExcel <- function(fileName=NULL){
  if(is.null(fileName)) {
    dataFrame <- data.frame(ID=101:110,
                            varA=runif(10),
                            varB=runif(10))
  } else {
    dataFrame <- read.table(file=fileName,
                            header=TRUE,
                            sep=",",
                            stringsAsFactors=FALSE)
  }
  
  return(dataFrame)
}
# if data file is loaded in, it needs to be a csv file for read.table to be able to read it.
#----------------------
getDatawithExcel("getData.csv")
csvdata <-getDatawithExcel("getData.csv")

##############
# FUNCTION: Analyze data using ANOVA
# INPUTS: Data and contrasts or the things that will be put into the function that will be analylzed.
# OUTPUTS: Summary of variables. Most important it will give you the p value. From there you should be able to determine if the differences in your data are significant or not.
#----------------
analyzeDatawithExcel <- function(data=csvdata){
  y=data[,2]
  x=data[,1]
  ANOVA <- aov(y~x,data=data)
  
  
  
  
  return(summary(ANOVA))
}
#---------------
analyzeDatawithExcel()

library(ggplot2)
##############
# FUNCTION: Graph data based on ANOVA ( categorical by continuous) analysis
# INPUTS: Data in a data frame
# OUTPUTS: Boxplot
##############
graphResultswithExcel <- function(data=csvdata){
  csvdataFrame <- data.frame(x=csvdata$Independent,y=csvdata$Dependent)
  graph <- qplot(data=csvdataFrame,
                 x=x,
                 y=y,
                 geom=c("smooth","point"))
  print(graph)
  
  
  
  
  
  return(graph)
}
#----------------
getDatawithExcel("getData.csv")
data <-getDatawithExcel("getData.csv")
analyzeDatawithExcel()
graphResultswithExcel()


