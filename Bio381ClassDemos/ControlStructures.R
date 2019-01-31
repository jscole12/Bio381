# Control structures for non-linear execution of code
# October 18, 2018
# JSC

# simple inequalities
5 > 3
5 < 3 
5 <= 5
5 == 3 # equals
5 != 3 # not equals

# use & for AND operation

5 >3 & 1 != 2
1 == 2 & 1 != 2

# | for Or comparison
1 == 2 | 1 != 2

# this works with vectors 
1:5 > 3

a <- 1:10
b <- 10:1
a > 4
b > 4
a > 4 & b > 4

# use "long form" of & and | to evaluate only the first element

a > 4 && b > 4

# also || for long form of OR

a < 4 || b > 4
a < 4 || b < 4 
a [1] < 4 | b[1] > 4 #identical to previous


# xor for exclusion OR testing
# work for (TRUE FALSE) but not for (TRUE TRUE)
a <- c(0,0,1)
b <- c(0,1,1)
a | b
xor(a,b)

# set operators
# boolean algebra on sets of atomic vectors (logical, numeric, character strings)

"three" < "five"
FALSE < TRUE

a <- 1:7
b <- 5:10

# union to get all elements
union(a,b)

# intersect to get common elements
intersect(a,b)

# setdif to get distinct elements in a
setdiff(a,b)
setdiff(b,a)

# setequal to check for identical elements 
setequal(a,b)

# equality compares element by element 
z <- matrix(1:12,nrow=4,byrow=TRUE)
z
z1 <- matrix(1:12,nrow=4,byrow=FALSE)
z1
z==z1
# use identical for entire structures
identical(z,z1)
z1 <- z
identical(z,z1)

# use %in% function to check for a subset

d <- 12
d %in% union(a,b)
is.element(d,union(a,b))

d <- c(10,12)
d %in% union(a,b)
d %in% a

# conditional if statements
# naked if statment
z <- signif(runif(1),digits=2)
print(z)
z > 0.5

if(z > 0.5) cat(z, "is a bigger than average number","\n")

# if with else
if (z > 0.8) cat(z,"is a large number","\n") else if (z < 0.2) cat("z is a small number", "\n") else 
  {cat(z,"is a number of typical size","\n")
    cat("z^2 =", z^2,"\n")}
# be careful with if statements, which require a single logical value

z <- 1:10

# this doesn't do anything
if (z > 7) print(z)

# also not so good
if(z < 7) print(z)

# use subsetting!
print(z[z<7])

# ifelse to fill vectors

# distribution of eggs laid lambda=10.2, p(parasitism) = 35%
tester <- runif(1000) # start with random uniform elements
eggs <- ifelse(tester>0.35,rpois(n=1000,lambda=10.2),0)
hist(eggs)

pVals <- rbeta(n=1000, shape1 <- 0.5, shape2 <- 0.5)
z <- ifelse(pVals <= 0.025,"lowerTail","nonSig")
z[pVals>=0.975] <- "upperTail"
head(z)
table(z)

# alternative coding
z1 <- rep("nonSig",1000)
z1[pVals<=0.025] <- "lowerTail"
z1[pVals>=0.975] <- "upperTail"
library(ggplot2)
qplot(x=pVals,fill=z1) # fill command will do mapping for us, will code according to category
