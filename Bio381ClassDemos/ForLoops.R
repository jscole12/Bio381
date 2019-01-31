# For loops in R
# October 23 2018
# JSC

myDogs <- c("chow","akita","malamut","husky","samoyed")
# not recommended for looping
for(i in myDogs){
  print(i)
}

# better to create a sequecne vector
for(i in 1:length(myDogs)){
  cat("i =",i,"myDogs[i] =",myDogs[i],"\n")
}
cat# problem with empty vector
myBadDogs <- NULL
for(i in 1:length(myBadDogs)){
  cat("i =",i,"myBadDogs[i] =",myBadDogs[i],"\n")
}

# use seq_along
for(i in seq_along(myDogs)){
  cat("i =",i,"myDogs[i] =",myDogs[i],"\n")
}
myBadDogs <- NULL
for(i in seq_along(myBadDogs)){
  cat("i =",i,"myBadDogs[i] =",myBadDogs[i],"\n")
}
# use external variable

zz <- 5
for( i in 1:zz){
  cat("i =",i,"myDogs[i] =",myDogs[i],"\n")
}
# tip # 1 dont do unnecessary things in the for loop!
for(i in 1:length(myDogs)){
  myDogs[i] <- toupper(myDogs[i])
  cat("i =",i,"myDogs[i] =",myDogs[i],"\n")
}
  
# do things outside the loop
myDogs <- c("chow","akita","malamut","husky","samoyed")
myDogs <- toupper(myDogs)
for(i in 1:length(myDogs)){
  
  cat("i =",i,"myDogs[i] =",myDogs[i],"\n")
}

# do not change object dimension in a loop(c,list,rbind,cbind)

myDat <- runif(1)
for (i in 2:20) {
  temp <- runif(1)
  myDat <- c(myDat,temp)
  cat("loop number=",i,"vector element=",myDat[i],"/n")
}
head(myDat)

# tip #3 Do not write a loop if you can vectorize the operation!

myDat <- 1:10
for (i in seq_along(myDat)) {
  myDat[i] <- myDat[i] + myDat[i]^2
  cat("loop number=",i,"vector element=",myDat[i],"/n")
}

z <- 1:10
z <- z + z^2
z
# tip # 4 be alert to distinction between counter variable i and the vector element z[i]

z <- c(10,2,4)
for(i in seq_along(z)) {
  cat("i =", i, "z[i]",z[i],"\n")
}

?# tip # 5 use 'next' to skip certain elements in the loop

z <- 1:20
# what if we want to work only with odd-numbered elements      

for(i in seq_along(z)) {
  if(i %% 2==0) next
  print(i)
}

# alternative that maybe be faster

Z <- 1:20
zsub <- z[z %% 2 !=0]
length(zsub)
for(i in seq_along(zsub)){
  cat("i =",i,"zsub[i] =",zsub[i],"\n")
}  
# create a simple random growth population model function

##################################################
# FUNCTION: RanWalk
# stochastic random walk 
# input: times = number of time steps
#        n1 = initial population size (= n[1])
#        lambda = finite rate of increase
#        noiseSD = sd of a normal distribution with mean 0
# output: vector n with population sizes > 0 
#         until extinction, then NA 
#------------------------------------------------- 
library(tcltk)
RanWalk <- function(times=100,n1=50,lambda=1.00,noiseSD=10) {
  n <- rep(NA,times)  # create output vector
  n[1] <- n1 # initialize with starting population size
  noise <- rnorm(n=times,mean=0,sd=noiseSD) # create noise vector
  for(i in 1:(times-1)) {
    n[i + 1] <- lambda*n[i] + noise[i]
    if(n[i + 1] <=0) {
      n[i + 1] <- NA
      cat("Population extinction at time",i-1,"\n")
      # tkbell()
      break}
  }
  
  return(n)
}

# explore paramaters in plot function
plot(RanWalk(),type="o")
plot(RanWalk(lambda=1.00,noiseSD=0),type="o")
