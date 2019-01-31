---
title: "First R markdown file"
author: "Jessica Cole"
date: "September 4, 2018"
output:
  html_document: 
    highlight: tango
    keep_md: yes
    number_sections: yes
  pdf_document: default
---



Hello world!   What happens to funny spacing?        Is it preserved?

First line.   
Second line.   
Third line.    

italic *this way*

bold face **like this**

subscript~lower~

superscript^raised^

strikethrough ~~for mistakes~~

# First Level

## Second Level

###Third Level

...

######Six Level!


lists are easy

- first item
- second item
- third item, and yes it will keep everything aligned just as it shuld be for longer text!
    - subitem
        - sub-subitem
        
>All musicians are subconsciously matemiticians

Thelonious Monk

Use single bactick for in-line emphasis `  like this`.

Shows literal text as `3 + pi`.

Start with r to get it to run r code this 6.1415927. 


### Code fencing

```
# Comments are important!
pred <- seq(1,10) # make a vector of intergers from one to 10
response <- runif(10)
print(response)

# now plot a graph
plot(x=pred,
     y=response,
     type="b")
```


```r
# Comments are important!
pred <- seq(1,10) # make a vector of intergers from one to 10
response <- runif(10)
print(response)

# now plot a graph
plot(x=pred,
     y=response,
     type="b")
```
     
## Links

http://example.com

[linked phrase](http://example.com)

A [linked phrase] [id]

[id]: http://example.com/ "Title"


![alt text][id] 

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell


```r
library(knitr)
```

```
## Warning: package 'knitr' was built under R version 3.5.2
```

```r
kable(head(iris))
```



 Sepal.Length   Sepal.Width   Petal.Length   Petal.Width  Species 
-------------  ------------  -------------  ------------  --------
          5.1           3.5            1.4           0.2  setosa  
          4.9           3.0            1.4           0.2  setosa  
          4.7           3.2            1.3           0.2  setosa  
          4.6           3.1            1.5           0.2  setosa  
          5.0           3.6            1.4           0.2  setosa  
          5.4           3.9            1.7           0.4  setosa  

## Creating equations with`LaTex`

An `inline` equations is bracketed by single dollar signs $3 + 5 = 8$ like this.

For more complex equations, we will render them on a single line by using a double dollar sign to bracket them:

$$3 + 5 = 8$$

Keeps this as a stand-alone piece.

Subscripts as follows:

$$H_0 = Z_{a + b_{3z}}$$

## Fractions and Greek symbols

$$\alpha=\frac{\beta}{\delta + \gamma_{x=3}}$$

## Summation sign

$$z=\sum_{i=1}^{J-1}{K_1}$$

## Escaping backslash character

$$ \backslash \alpha \le b \backslash$$

## Mixing plain text in LaTex

$$P(\mbox{Occurrence of Species A})=Z$$
