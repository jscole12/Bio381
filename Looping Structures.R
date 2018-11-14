counter <- 0
Nvec <-rpois(10,1)
for (i in 1:length(Nvec)) {
 if(Nvec[i]==0) counter <- counter + 1
}



# 1
##############
# FUNCTION: Counting zeros in different lenghts of variables
# INPUTS:Numeric vector and assigned zero variables
# OUTPUTS: number of zeros
#----------------
countingvariables <- function(vec=Nvec){
counter <- 0
for (i in 1:length(vec)){
    if(vec[i]==0) counter <- counter + 1}



return(counter)
}
#----------------
countingvariables()
Nvec1 <-rep(0,10)
countingvariables(Nvec1)

# 2
##############
# FUNCTION: Counting zeros in different lenghts of variables
# INPUTS:Numeric vector and assigned zero variables
# OUTPUTS: number of zeros
#----------------
countingvariables2 <- function(vec=ss){
  return(length(subset(vec, vec == 0)))
  
  
  

}
#----------------
countingvariables2()
ss <- rpois(10,1)
length(subset(ss, ss == 0))
ss[ss==0]


#3
#################
#Function: Populate an empty matrix based on row and column numbers
# Input: empty matrix
#Output: a filled matrix based on column and row numbers

matrixE <- matrix(ncol=5,nrow=5)

fillMatrix <- function(Ncol=5,Nrow=5){
  matrixE <- matrix(ncol=Ncol,nrow=Nrow)
for (i in 1:nrow(matrixE)) {
  for (j in 1:ncol(matrixE)) {
    matrixE[i,j] <- i * j
    }
  }

return(matrixE)
}
fillMatrix()
matrixE <- matrix(ncol=6,nrow=6)
fillMatrix(Ncol=6,Nrow=6)

#4
# Read in data
#functions readData
readData <- function(fileName=NULL){
  if(is.null(fileName)){
    xObs <- 1:20
    yObs <- xObs + 10*rnorm(20)
    dF <- data.frame(ID=seq_along(xObs),
                     xObs,
                     yObs)} else {
                       dF <- read.table(file=fileName,
                                        header=TRUE,
                                        sep=",",
                                        stringsAsFactors=FALSE)}
  return(dF)
}
readData()
readData("catsData.csv")

dataFrame <- readData("catsData.csv")


# calculate the metric
getMetric <- function(data=dataFrame){
 y=data[,2]
 x=data[,1]
 ANOVA <- aov(y~x,data=data)
 summary <- summary(ANOVA)
 pval<-summary[[1]][["Pr(>F)"]][1]
 
 # pval <- str$coefficients[1:2]
 # pval <- summary$coefficients

   return(pval)
 
}
getMetric()

# ANOVA <- aov(Hwt~X,data=dataFrame)
# summary <- summary(ANOVA)



# randomize
shuffleData <- function(z=NULL){
  if(is.null(z)){
    xObs <- 1:20
    yObs <- xObs + 10*rnorm(20)
    z <- data.frame(ID=seq_along(xObs),xObs,yObs)}
  z[,3] <- sample(z[,3])
  return(z)
}
shuffleData()



