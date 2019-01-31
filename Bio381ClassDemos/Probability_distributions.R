# Examples of probability distributions
# October 2 2028
# JSC
library(ggplot2)
library(MASS)
# Poisson distribution

# p function for cumulative distribution values
 hits <- 0:10
 myVec <- ppois(q=hits, lambda = 2)
qplot(x=hits, y=myVec, geom="col", color=I("black"),fill=I("goldenrod"))

# for a poisson with lambda=2
# what is the probability of a single draw yeilding x<= 1
ppois(q=1,lambda=2)


p1 <- dpois(x=0, lambda = 2)
p1
p2 <- dpois(x=1,lambda = 2)
p2
p1 + p2

# the q function is the inverse of the p function

# what is the number of hits corresponding to a tail probability mass?

qpois(p=0.5,lambda = 2.5)
qplot(x=0:10, y=dpois(x=0:10, lambda = 2.5), geom = "col", color=I("black"), fill=I("goldenrod"))

# simulate values directly
ranPois <- rpois(n=1000,lambda = 2.5)
qplot(x=ranPois,color=I("black"),fill=I("goldenrod"))

# for real or simulated data
# get the 95% interval over the distribution

quantile(x=ranPois,probs = c(0.025,0.975))

# binomial function
# p = probability of dichotomous outcome
# number of trials
# x = possible outcomes
# x is bounded between 0 and number of trials

hits <- 0:10
myVec <- dbinom(x=myVec,hits,size = 10,prob = 0.5)
qplot(x=0:10, y=myVec,geom="colo",color=I("black"), fill=I("goldenrod"))


#what is the probability of getting 5 heads out of 10?

dbinom(x=5, size=10, prob=0.5)

hits <- 0:10
myVec <- dbinom(x=hits,size = 10,prob = 0.95)
qplot(x=0:10, y=myVec,geom="col",color=I("black"), fill=I("goldenrod"))

pbinom(q=5, size=10, prob = 0.5)
pbinom(q=4, size=9, prob = 0.5)


# get a 95% confidence interval
qbinom(p=c(0.025,0.975), size=100, prob= 0.7)


myCoins <- rbinom(n=50, size = 100, prob =0.5)
qplot(x=myCoins,color=I("black"), fill=I("goldenrod"))

# negative binomial
# if we have series of (Bernouli) trials with p= probability of success
# how many failures until we reach that number of successes?
# a Poisson proecces in which the value of lamdba is not constant.


# changeing a parameter
# increase size(=less variable)
nbiRan <- rnbinom(n=1000,size = 100, mu=5)
qplot(x=nbiRan,color=I("black"), fill=I("goldenrod"))

# decreasing the size parameter (= more  variable)
nbiRan <- rnbinom(n=1000,size = 0.1, mu=5)
qplot(x=nbiRan,color=I("black"), fill=I("goldenrod"))

# continuous distribution

# uniform
# params = minumum and maximum values that can occure
# within those ranges, any value are equally probable
x <- runif(1000,min = 0,max = 5)
qplot(x=x,color=I("black"), fill=I("goldenrod"))

# normal distribution
# unbounded in directions
myNorm=rnorm(n=100,mean=100,sd=2)
qplot(x=myNorm,color=I("black"), fill=I("goldenrod"))

# decreasing mean value
myNorm <- rnorm(n=100,mean=2,sd=2)
qplot(x=myNorm,color=I("black"), fill=I("goldenrod"))
summary(myNorm)

# grab values greater than zero and get rid of them
tossZereos <- myNorm[myNorm>0]
qplot(x=tossZereos,color=I("black"), fill=I("goldenrod"))
summary(tossZereos)

# gamma distribution, generates continous positive values
# unbounded but > 0
# shape parameter
# scale parameters

myGamma <- rgamma(n=100,shape=1,scale=10)
qplot(x=myGamma,color=I("black"), fill=I("goldenrod"))

# gamma with shape=1 is exponential
# with mean=scale
# (size parameter in negative binomial is equivalent to the shape parameter for a gamma distrbution of lambdas)


# shape <= 1 mode is very close to 0 (generate tiny values)
myGamma <- rgamma(n=100,shape=0.1,scale=1)
qplot(x=myGamma,color=I("black"), fill=I("goldenrod"))
# mean = shape*scale <- gives you the mean of distriution
# variance = shape*scale^2

# beta distribution
# continuous, bounded at 0 and 1
# analagous to the binomial
# but it is the distribution of probability values, not the distribution of the number of successeds
# shape1 = number of successes + 1
# shape2 = number of failures + 1

# shape=1, shape2=1
myBeta <- rbeta(n=1000,shape1 = 1,shape2 = 1)
qplot(x=myBeta,color=I("black"), fill=I("goldenrod"))

# shape1 = 2, shape2=1)
myBeta <- rbeta(n=1000,shape1 = 2,shape2 = 1)
qplot(x=myBeta,color=I("black"), fill=I("goldenrod"))

# two tosses 1 head and 1 tail
myBeta <- rbeta(n=1000,shape1 = 2,shape2 = 2)
qplot(x=myBeta,color=I("black"), fill=I("goldenrod"))

# throw two tails
myBeta <- rbeta(n=1000,shape1 = 1,shape2 = 3)
qplot(x=myBeta,color=I("black"), fill=I("goldenrod"))

# get better data
myBeta <- rbeta(n=1000,shape1 = 70,shape2 = 30)
qplot(x=myBeta,xlim=c(0,1),color=I("black"), fill=I("goldenrod"))


myBeta <- rbeta(n=1000,shape1 = 0.1,shape2 = 0.5)
qplot(x=myBeta,xlim=c(0,1),color=I("black"), fill=I("goldenrod"))

# beta is good a simulating a probability