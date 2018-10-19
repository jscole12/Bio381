##############
# FUNCTION: Put data into data frame
# INPUTS: file name with specified independent and dependent variables
# OUTPUTS: Data frame
#----------------
getDatawithexcel <- function(fileName=NULL){
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
getDatawithexcel("getData.csv")

dataFramewexcel<-getData("getData.csv")
getDatawithexcel()


##############
# FUNCTION: Analyze data using ANOVA
# INPUTS: Data and contrasts or the things that will be put into the function that will be analylzed.
# OUTPUTS: Summary of variables. Most important it will give you the p value. From there you should be able to determine if the differences in your data are significant or not.
#----------------
analyzeData <- function(data=dataFrame){
  y=data[,2]
  x=data[,1]
  ANOVA <- aov(y~x,data=data)
  
  
  
  
  return(summary(ANOVA))
}
#---------------

Graph Results
graphResults <- function(data=data){
  dataFrame2 <- data.frame(x=data$independent,y=data$dependent)
  graph <- qplot(data=data,
                 x=x,
                 y=y,
                 geom=c("smooth","point"))
  print(graph)
  
  