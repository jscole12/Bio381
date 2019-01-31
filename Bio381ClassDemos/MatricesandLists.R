#basic operations on matrices and lists
# 18 September 2018
#JSC

m <- matrix(data=1:12,
            nrow=4,
            ncol=3)
print(m)
dim(m)
m <- matrix(data=1:12,
            nrow=4,
            byrow=TRUE)
print(m)

#change dimensions
dim(m) <-c(6,2)
print(m)
dim(m) <- c(4,3)
print(m)
nrow(m)
ncol(m)
length(m)

# add row and column names
rownames(m)
rownames(m) <- c("a", "b", "c", "d")
print(m)
colnames(m) <- LETTERS[1:ncol(m)]
print(m)
print(m[2,3])
print(m[1:2,2:3])
print(m[,2:3])
print(m[1:2,])
print(m[,])
rownames(m) <- paste("Species",LETTERS[1:nrow(m)],sep="")
colnames(m) <- paste("Site",1:ncol(m),sep="")
print(m)
m["SpeciesD","Site2"]

dimnames(m) <- list(paste("Site",1:nrow(m),sep=""),
                     paste("Species",letters[1:ncol(m)],sep=""))
print(m)                             
#t for transpose
print(t(m))

# adding rows or columns to matrix
m2 <- t(m)
m2 <- rbind(m2,c(20,20,30,40))
print(m2)
rownames(m2)                           
rownames(m2)[4] <- "myFix"

print(m2)
m2["myFix","Site1"]
m2[c("myFix","Speciesa"),c("Site3","Site2")]



# Introducing Lists

myList <- list(1:10,
               matrix(1:8,nrow=4,byrow=TRUE),
                    letters[1:3],
                    pi)
myList[4]
#myList[4] - 3 # can't subrtract a number from a list
myList[[4]] - 3 # pulls out the value

# list of 10 elements, a train with 10 cars
# x[5] fifth car in the train
# x[[5]] contents of the fifth car
# x[c(4,5,6)] made a new train with 3 cars

myList[[2]] #full matrix
myList[[2]][3,2]

# naming list items

myList2 <- list(Tester=FALSE,
                LittleM=matrix(1:9,nrow=3))
myList2$LittleM #prints entire Matrix
myList2$LittleM[1,]

# unlist is very helpful for lists!
unRolled <- unlist(myList2)
unRolled

#use unlist for accessing model output
library(ggplot2)
yVar <- runif(10)
xVar <- runif(10)
myModel <- lm(yVar~xVar)
qplot(x=xVar,y=yVar)
print(myModel)
print(summary(myModel))
str(summary(myModel))
summary(myModel)$coefficients
summary(myModel)$coefficients[2,4]

# find what you want by unlisting the model summary

u <- unlist(summary(myModel))
u
mySlope <- u$coefficients2
myPValue <- u$coefficients8

mySlope
myPValue

# Data frame
# - a list of atomic vectors
# - all vectors (=columns)same length

# build a data frame from scratch

varA <- 1:12
varB <- rep(c("Con", "Low", "HighN"),each=4)
varC <- runif(12)
dFrame <- data.frame(varA,varB,varC,stringsAsFactors=FALSE)
str(dFrame)
head(dFrame)

# add a row with rbind

newData <- list(varA=13,varB="HighN",varC=0.668)
print(newData)
str(newData)
dFrame <- rbind(dFrame,newData)
tail(dFrame)

# add a column to a data frame
newVar <- runif(13)
dFrame <- cbind(dFrame,newVar)
head(dFrame)

# similarities and differences of data frams and matrices


zMat <- matrix(data=1:30,ncol=3, byrow=TRUE)
zDframe <- as.data.frame(zMat)

str(zMat)
str(zDframe)

head(zDframe)
head(zMat)

zMat[3,3]
zDframe[3,3]

# column referencing
zMat[,2]
zDframe[,2]
zDframe$V2 # would not work for matrix

# referencing single items
zMat[2]
zMat
zDframe[2] # single variable out of data frame, interprets it as single column
zDframe["V2"]
zDframe$V2

# subscritpint and dealing with missing data

set.seed(99) 
z <- 1:10 # simple sequence
z
z <- sample(z) # sample w/o replacement - reshuffle elements
z
z < 4 # logical vector - corresponds to what elements are less than 4
z[z < 4] # subset vector, gives us the numbers that are less than 4
which(z < 4) # get subscripts, tells us what slots had values less than 4
z[which(z<4)]

zD <- c(z,NA,NA)
zD

zD[zD < 4] # subset will pull NA
zD[which(zD < 4)] # which functions will pull functions and not the NAs

# use complete.cases to eliminate NA values

print(zD)
complete.cases(zD) # gives logical
zD[complete.cases(zD)]

# use this to find missing value slots

which(!complete.cases(zD)) # where are the missing cases

# now apply this to a matrix
m <- matrix(1:20,nrow=5)
m[1,1] <- NA
m[5,4] <- NA
m

m[complete.cases(m),] # complete.case will strip out entire row

m[complete.cases(m[,c(2,3)]),]
