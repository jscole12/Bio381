# functions in r
# October 11 2018
# JSC

sum(3,2) # 'prefix' functions
3 + 2 # an operator, but actiually an 'infix' 
`+`(3,2)
`<-`(yy,3)
yy

sd # prints function contents
sum # primitive functions
sd(c(3,2))
#sd() # uses default parameters
sum()


##############
# FUNCTION: HardyWeinberg
# INPUTS: an allele frequency p(0,1)
# OUTPUTS:P and the frequencies of the 3 genotypes AA ,AB ,BB
#----------------
HardyWeinberg <- function(p=runif(1)) {
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p,
                  AA=fAA,
                  AB=fAB,
                  BB=fBB),digits=3)
  return(vecOut)
}
#----------------

HardyWeinberg
HardyWeinberg(p=0.02)
HardyWeinberg()

# Multiple return statements for different possible return vlaes
##############
# FUNCTION: HardyWeinberg
# INPUTS: an allele frequency p(0,1)
# OUTPUTS:P and the frequencies of the 3 genotypes AA ,AB ,BB
#----------------
HardyWeinberg2 <- function(p=runif(1)) {
  if(p >1.0 | p < 0.0){
    stop("Function failure: p out of bounds")}
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p,
                     AA=fAA,
                     AB=fAB,
                     BB=fBB),digits=3)
  return(vecOut)
}
##############
HardyWeinberg3 <- function(p=runif(1)) {
  if(p >1.0 | p < 0.0){
    stop("Function failure: p out of bounds")}
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p,
                     AA=fAA,
                     AB=fAB,
                     BB=fBB),digits=3)
  return(vecOut)
}
HardyWeinberg3()
# HardyWeinberg3(p=1.1)
##############

# scoping in functions
# global variables
# local variables
myFunc <- function(a=3,b=4){
  z <- a + b
  return(z)
}
myFunc()

myFuncBad <- function(a=3) { # do not actually do this
  z <- a + b
  return(z)
}
# myFuncBad()
# b <- 100 # global variable
# myFuncBad()




################
# FUNCTION: fitlinear
# INPUTS: numeric vector of predictor (x) and response(y)
# OUTPUTS: slope and p value
#----------------
fitlinear <- function(x=runif(20),y=runif(20)) {
  
  myMod <- lm(y~x) # fit of linear model 
  myOut <- c(slope=summary(myMod)$coefficients[2,1],
             pValue=summary(myMod)$coefficients[2,4])
  plot(x=x,y=y)
return(myOut)
}
#----------------
fitlinear()
varA <- 1:100
varB <- rnorm(100)
fitlinear(x=varA,y=varB)


################
# FUNCTION: fitlinear
# INPUTS: numeric vector of predictor (x) and response(y)
# OUTPUTS: slope and p value
#----------------
fitlinear2 <- function(p=NULL) {
  if(is.null(p)){
    p <- list(x=runif(20),y=runif(20))
  }
  myMod <- lm(p$y~p$x) # fit of linear model 
  myOut <- c(slope=summary(myMod)$coefficients[2,1],
             pValue=summary(myMod)$coefficients[2,4])
  plot(x=p$x,y=p$y)
  return(myOut)
}

fitlinear2()
