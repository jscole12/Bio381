# Script for batch processing of multiple files
# November 1 2018
# NJG

################
# function: FileBuilder
# creates set of randome files for regression
# input: fileN = number of files to create
# fileFloder = number of folder to hold files
# file size = c(min,max) number of rows
# fileNA = average number of NA values per columns
# output: set of random files
#-------------------------------
fileBuilder <- function(fileN=10,
                        fileFolder="RandomFiles/",
                        fileSize=c(15,100),
                        fileNA=3){
  for (i in seq_len(fileN)) {
    fileLength <- sample(fileSize[1]:fileSize[2],size=1)
    varX <- runif(fileLength)
    varY <- runif(fileLength)
    df <- data.frame(varX,varY)
    badVals <- rpois(n=1,lambda=fileNA)
    df[sample(nrow(df),size=badVals),1] <- NA
    df[sample(nrow(df),size=badVals),2] <- NA

    #create labal for file name with padded zeroes
    fileLabel <- paste(fileFolder,
                       "ranFile",
                       formatC(i,
                        width=3,
                        format="d",
                        flag="0"),
                       ".csv",sep="")
    
    # set up data file and incorporate time stamp
    # and minimal metadata
    
    write.table(cat("# Simulated random data file for batch processing","\n",
                    "# timestamp: ",as.character(Sys.time()),"\n",
                    "#JSC","\n",
                    "#--------------------","\n",
                    "\n",
                    file=fileLabel,
                    row.names="",
                    col.names="",
                    sep=""))
                
# finally add the data frame
write.table(x=df,
            file=fileLabel,
            sep=",",
            row.names=FALSE,
            append=TRUE)
  }
}

#############################################
# functions: regStats
# fits linear model extracts statistics
# input: 2- columns data frame(x and y)
# output: slope, p-value, and r2
regStats <- function(d=NULL) {
  if(is.null(d)) {
    xVar <- runif(10)
    yVar <- runif(10)
    d <- data.frame(xVar,yVar)
  }
  . <- lm(data=d,d[,2]~d[,1])
  . <- summary(.)
  statsList <- list(Slope=.$coefficients[2,1],
                    pVal=.$coefficients[2,4],
                    r2=.$r.square)
  return(statsList)
}

##################################################
# set.seed(100)

#------------------------------
# Global Variables
fileFolder <- "RandomFiles/"
nFiles <- 100
fileOut <- "statsSummary.csv"
#_------------------------------

# Create 100 random data sets
fileBuilder(fileN=nFiles)
fileNames <- list.files(path=fileFolder)

# Create data frame to hold summary statistics
ID <- seq_along(fileNames)
slope <- rep(NA,nFiles)
pval <- rep(NA,nFiles)
r2 <- rep(NA,nFiles)
statsOut <- data.frame(ID,fileNames,slope,pval,r2)


# bact process through each file with a loop
for (i in seq_along(fileNames)) {
  data <- read.table(file=paste(fileFolder,fileNames[i],sep=""),
                     sep=",",
                     header=TRUE)
  dClean <- data[complete.cases(data),] # cleans out NAs
  . <- regStats(dClean)
  statsOut[i,3:5] <- unlist(.)
}
# set up output file and incorporate time stamp 
# and minimal metadata

write.table(cat("#Summary stats for ",
                "# batch processing of regression models","\n",
            "# NSC","\n",
            "#---------------------","\n",
            "\n", 
            file=fileOut,
            row.names="",
            col.names="",
            sep=""))

# now add the data frame
write.table(x=statsOut,file=fileOut,
            row.names=FALSE,
            col.names=TRUE,
            sep=",",
            append=TRUE)
