r <- 0.1
N <- 15
k <- 250
t <- 300
tvec <- 0:t
Nvec <- c()

Nvec <- (k/(((k-N)/N)*(exp(1)^((-r*tvec)))+1))
Nvec1 <- data.frame(t,Nvec)

plot(y=Nvec,x=tvec)

library(ggplot2)
  dataFrame <- data.frame(tvec,Nvec)
  
  p1 <- qplot(data=dataFrame,
              x=tvec,
              y=Nvec, geom="line") 
  print(p1)
  

  
                                                   