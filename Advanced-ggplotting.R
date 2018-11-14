# Advanced ggplotting
# November 7 2018
# JSC

library(ggplot2)
data <- trees

# basic histogram of tree girth
treeHist <- qplot(x=trees$Girth,color=I("black"),fill=I("green"))

# Change of theme
treeHist + theme_grey(base_size=15) 

# aesthetics - adding in a Title, subtitle, and a caption & changing the point sizes
p <- ggplot(data=trees, 
            mapping=aes(x=Height,y=Girth)) + 
  geom_point(size=3,shape=21,color="black",fill="skyblue")+ 
  labs(title = "Height by Girth",
         subtitle = "This is a scatter plot looking at the values of Girth and Height relatively",
         caption = "This is a caption for the graph. I found out how to do a caption.")

p + theme_gray(base_size=14) # changing the size of the margins


p3 <- ggplot(data=trees,
             mapping=aes(x=Girth,
                         fill=Height)) + geom_()
print(p3)      
