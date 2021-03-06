# ggplot basics
# November 6 2018
# JSC

# Preliminaries
library(ggplot2)
library(ggthemes)
# library(patchwork)

d <- mpg
str(d)
table(d$fl)

# simple quick qplot graphs

# histograme
qplot(x=d$hwy)
qplot(x=d$hwy,color=I("black"),fill=I("goldenrod"))

# make your own function

myHisto <- function(xVar,filcol="goldenrod"){
  qplot(x=xVAr,color=I("black"),fill=I(filCol))}
myHisto(d$hwy)
myHisto(d$hwy,"thistle")

# basic density plot
qplot(d$hwy,geom="density")

# basic scatter plot
qplot(x=d$displ,y=d$hwy,geom=c("smooth","point"))
qplot(x=d$displ,y=d$hwy,geom=c("smooth","point"),method="lm")

# basic boxplot
qplot(x=d$fl,y=d$hwy,geom="boxplot",fill=I("green")) # I=identify function. turns into function and applies it to the data,
qplot(x=d$fl,y=d$hwy,geom="boxplot",fill="green") # wrong way to use "fill" function

# basic barplot (long format)
qplot(x=d$fl,geom="bar",fill=I("green"))

# bar plot in short format - not sounting up individual rows, have a summary statistics
xTreatment <- c("Control","Low","High")
yResponse <- c(12,2.5,22.9) # could be averages 
qplot(x=xTreatment,
      y=yResponse,
      geom="col", # stands for columns
      fill=I(c("red","blue","green")))

# basic curves and functions
myVec<- seq(1,100,by=0.1)
myFun <- function(x)sin(x) + 0.1*x

# plot built in functions
qplot(x=myVec,y=sin(myVec),
      geom="line")
# plot analytic stats functions

qplot(x=myVec,y=dgamma(myVec,shape = 5,scale=3),geom="line")

# plot user defined functions
qplot(x=myVec,y=myFun(myVec),geom="line")

# themes and fonts
p1 <- ggplot(data=d,
             mapping=aes(x=displ,y=cty)) + geom_point()
print(p1)

p1 + theme_classic()
p1 + theme_linedraw()
p1 + theme_dark()
p1 + theme_base()
p1 + theme_par()
p1 + theme_void()
p1 + theme_solarized()
p1 + theme_economist()
p1 + theme_grey() # default theme that ggplot uses

# major theme modifications
p1 + theme_classic(base_size=40,base_family="serif") # adjust the margin labels and the size of margin labels

# defaults in ggplot: theme_gray,base_size=16,base_family="Helvetica"

# font familes ( Mac) Times,Ariel,Monaco,Courier,Helvetica # more general ones, serif, sans, mono

# use coordinate flip to change axes
p2 <- ggplot(data=d,
             mapping=aes(x=fl,
                         fill=fl)) + geom_bar()
print(p2)                         

# flip axes

p2 + coord_flip() + 
  theme_grey(base_size = 20,base_family = "sans")


# minor theme modifications
p1 <- ggplot(data=d,
             mapping=aes(x=displ,y=cty)) +
  geom_point(size=7,shape=21,color="black",fill="steelblue") +
  labs(title="My graph title here",
       subtitle="An extended subtitle that will print beneath the main title",
       x="My x axis label",
       y="My y axis label") +
  xlim(0,4) + ylim(0,20)
print(p1)   # shape...coloring the point, NOT THE ACTUAL DATA 
