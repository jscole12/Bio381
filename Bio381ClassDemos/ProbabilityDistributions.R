# Examples of probability distributions
# October 2 2018
# JSC

# Poisson distribution
# Discrete X >= 0
# Random events occur with a constant rate lambda

MyVec <- dpois(x= seq(0,10), lambda = 1)
names(MyVec) <- seq(0,10)
barplot(height=MyVec)


MyVec <- dpois(x= seq(0,10), lambda = 0.2)
names(MyVec) <- seq(0,10)
barplot(height=MyVec)
# sume of area under curve is 1
sum(MyVec)

# with lambda = 2, what is the probability of obtaining a zero?
dpois(x=0,lambda=2)
