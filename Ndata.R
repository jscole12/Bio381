library(ggplot2)
getDatawithExcel <- function(fileName=NULL){
  if(is.null(fileName)) {
    df <- data.frame(ID=101:110,
                            varA=runif(10),
                            varB=runif(10))
  } else {
    df <- read.table(file=fileName,
                            header=TRUE,
                            sep=",",
                            stringsAsFactors=FALSE)
  }
  
  return(df)
}
getDatawithExcel()

nData <-getDatawithExcel("NewCarInterestRates.csv")


analyzeDatawithExcel <- function(data=nData){
  y=data[,2]
  x=data[,1]
  ANOVA <- aov(y~x,data=data)
  pVal <- summary(ANOVA)[[1]][["Pr(>F)"]][1]
  
  
  
  
  
  return(pVal)
}

analyzeDatawithExcel()
df <- nData

shuffleData <- function(n=nData){
  n[,2] <- sample(n[,2])
  return(n)
}
shuffleData()
# n <- shuffleData()

# create histogram of simulated and observed metric
plotRanTest <- function(z=NULL) {
  if(is.null(z)){
    z <- list(rnorm(1),rnorm(1000)) }
  dF <- data.frame(ID=seq_along(z[[2]]),simX=z[[2]])
  p1 <- ggplot(data=dF,mapping=aes(x=simX))
  p1 + geom_histogram(mapping=aes(fill=I("goldenrod"),color=I("black"))) +
    geom_vline(aes(xintercept=z[[1]],col="blue")) 
  
}


nSim <- 1000
Xsim <- rep(NA,nSim) # vector of simulated slopes
dF <- getDatawithExcel("NewCarInterestRates.csv")
Xobs <- analyzeDatawithExcel(dF)

for (i in seq_len(nSim)) {
  Xsim[i] <- analyzeDatawithExcel(shuffleData(dF))
}

slopes <- list(Xobs,Xsim)
plotRanTest(slopes)







