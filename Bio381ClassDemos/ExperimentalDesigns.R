# Basics stats models in R
# October 9 2018
# JSC

library(tidyverse)

# Data construction for regression

n <- 50 # number of observations

varA <- runif(n) # random uniform (independent)
varB <- runif(n) # dependent

varC <- 5.5 + varA*10 # noisy dependence
ID <-seq_len(n)
regData <- data.frame(ID,varA,varB,varC)
head(regData)
str(regData)

# Basics regression analysis in R - basic structure of linear model
regModel <- lm(varB~varA,data=regData)
regModel
str(regModel)
head(regModel$residuals) # accessing residuals

summary(regModel)
str(regModel)
z <- unlist(summary(regModel))
z
z$coefficients7

# put needed results in a new list - make sure you go and find these variables
regSum <- list(intercept=z$coefficients1,
               slope=z$coefficients2,
               interceptP=z$coefficients7,
               slopeP=z$coefficients8,
               r2=z$r.squared)
print(regSum)
regSum$r2
regSum[[5]]

# basic ggplot of regression model
regPlot <- ggplot(data=regData,
                  aes(x=varA,y=varB)) +
  geom_point() +
                  stat_smooth(method=lm,se=99)
print(regPlot)
ggsave(filename = "Plot1.pdf",
       plot=regPlot,
       device="pdf")
       
# Data frame construction for ANOVA
nGroup <- 3
nName <- c("Control","Treat1","Treat2")
nSize <- c(12,17,9)
nMean <- c(40.1,42,60)aov

nSD <- c(5,5,5)

ID <- 1:(sum(nSize))

resVar <- c(rnorm(n=nSize[1],mean=nMean[1],sd=nSD[1]),
            rnorm(n=nSize[2],mean=nMean[2],sd=nSD[2]),
            rnorm(n=nSize[3],mean=nMean[3],sd=nSD[3]))
TGroup <- rep(nName,nSize)
table(TGroup)
ANOdata <- data.frame(ID,TGroup,resVar)
str(ANOdata)
head(ANOdata)

# Basica ANOVA  model in R
ANOmodel <- aov(resVar~TGroup,data=ANOdata)
print(ANOmodel)
print(summary(ANOmodel))
z <- summary(ANOmodel)
str(z)
unlist(z)
ANOsum <- list(Fvalue=unlist(z)[7], probF=unlist(z)[9])
ANOsum

# Basic ggplot of ANOVA data

ANOPlot <- ggplot(data=ANOdata,
                  aes(x=TGroup,y=resVar,
                      fill=TGroup)) + 
  geom_boxplot()
print(ANOPlot)

# Data frame for logistic regressions

xVar <- sort(rgamma(n=200,shape=5,scale=5))
yVar <- sample(rep(c(1,0),each=100),prob=seq_len(200))
lRegData <- data.frame(xVar,yVar)

# logistic regresion analysis
lRegModel <- glm(yVar~xVar,
                 data=lRegData,
                 family=binomial(link=logit))
summary(lRegModel)

# Basic ggplot of logistic regression

lRegPlot <- ggplot(data=lRegData,
                   aes(x=xVar,y=yVar)) +
  geom_point() +
  stat_smooth(method=glm, method.args=
                list(family=binomial))
print(lRegPlot)


# inter counts od different data groups
vec1 <- c(50,66,22)
vec2 <- c(120,22,30)
dataMatrix <- rbind(vec1,vec2)
rownames(dataMatrix) <- c("Cold", "Warm")
colnames(dataMatrix) <- c("S1","S2", "S3")
str(dataMatrix)
dataMatrix

# basic contingency analysis
print(chisq.test(dataMatrix))

# simple plots in base R
mosaicplot(x=dataMatrix,
           col=c("goldenrod",
                 "grey",
                 "black"),
           shade=FALSE)

barplot(height=dataMatrix,
        beside=TRUE,
        col=c("cornflowerblue","tomato"))
 