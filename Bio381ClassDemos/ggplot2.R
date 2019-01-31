# multi panel layouts in ggplot and other cool stuff
# November 8 2018
# JSC
library(ggplot2)
library(ggthemes)
library(patchwork)
d <- mpg
g1 <- ggplot(data=d,
             mapping=aes(x=displ,y=cty)) +
  geom_point() +
  geom_smooth()
print(g1)

g2 <- ggplot(data=d,
             mapping=aes(x=fl,fill=I("tomato"),
                               color=I("black"))) +
               geom_bar(stat="count") + 
               theme(legend.position="none")
g2             
   
g3 <- ggplot(data=d,
             mapping=aes(x=displ,
                         fill=I("royalblue"),
                         color=I("black"))) +
  geom_histogram()
print(g3)                         

g4 <- ggplot(data=d,
             mapping=aes(x=fl,y=cty,fill=fl)) +
  geom_boxplot() +
  theme(legend.position="none")
print(g4)


# place 2 plots horizontally
g1 + g2


# place 3 plots vertically 
g1 + g2 + g3 + plot_layout(ncol=1)

# change relative plotting area(heights of the graphs relative to each other)
g1 + g2 +
  plot_layout(ncol=1,heights=c(2,1))

g1 + g2 +
  plot_layout(ncol=2,widths=c(1,2))

# add a spacer plot(space in between the plots)
g1 + plot_spacer() + g2

# use nested layouts ( arranging the position between multiple graphs)
g1 + {
  g2 + {
    g3 +
      g4 +
      plot_layout(ncol=1)
  }
} +
  plot_layout(ncol=1)
# operator - for subtrack placement
g1 + g2 - g3 +
  plot_layout(ncol=1)

#/ and | for intuitive layouts
(g1 | g2 | g3)/g4
(g1 | g2)/(g3 | g4)

# swapping axis orientation
g3a <- g3 + scale_x_reverse()
g3b <- g3 + scale_y_reverse()
g3c <- g3 + scale_x_reverse() +
  scale_y_reverse()
(g3 | g3a)/(g3b|g3c)

# coordinate flip(flip the x and y axis)
(g3 + coord_flip() | g3a + coord_flip())/(g3b + coord_flip() | g3c + coord_flip())

# mapping of aesthetics

# mapping of a discrete variable to color(when you want to make different point catergories a different color based on what data set they are in. color of the points)
m1 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=class)) + geom_point(size=3)
m1

# map class to shape ( making differnet points a different shape based on what data set they are in. shapes of the points)
m2 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,shape=class)) + geom_point(size=3)
m2

# map a discrete variable to size ( changign the size of the point based on what class of data it is in, not a good idea because size of point makes no sense)
m3 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,size=class)) + geom_point()
m3

# map a continuous variable to size(when size is matched to a continuous variable, it is better because it makes more sense. )
m4 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,size=hwy)) + geom_point()
m4

# map a continuous variable to color(creates a color gradient scale built off ov continous variable)
m5 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=hwy)) + geom_point()
m5

# map multiple variables
m6 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=hwy,shape=class)) + geom_point()
m6

# use shape for fewer categories
m7 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=fl,shape=drv)) + geom_point()
m7

# use all 3 (size,shape,color)
m8 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=fl,shape=drv,size=hwy)) + geom_point()
m8


# faceting features of ggplot to add aditional attributes

# basis faceting rows,cols

m1 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty)) + geom_point() + 
               facet_grid(class~fl)
m1

# free scales - y scales are not all the same
m1 + facet_grid(class~fl,scales="free_y")

m1 + facet_grid(class~fl,scales="free") # x and y axis are not all the same

# plot just with rows or columns
m1 + facet_grid(.~class) # dont give any rows(runs vertically)
m1 + facet_grid(class~.) # dont give any columns( runs horizontally)

#facet_wrap versus facet_grid
m1 + facet_grid(.~class)

m1 + facet_wrap(~class) # graphs are not in indivudual fixed columns. put into square format. (not fixing rows or columns) no ordering or crossing, but sqaure format as close as possible
m1 + facet_wrap(~class + fl) 
m1 + facet_wrap(~class +fl,drop=FALSE)

# use facets with other aesthetics
m1 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=drv)) +
  geom_point()
m1 + facet_grid(.~class)

#switch to other geoms ( switching from points to lines)
m1 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=drv)) +
  geom_smooth(se=FALSE,method="lm")
m1 + facet_grid(.~class)

# fit with a boxplot over a continuous variable
m1 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,color=drv)) +
  geom_boxplot()
m1 + facet_grid(.~class)

# add a group and fill mapping( group and color boxplots)
m1 <- ggplot(data=mpg,
             mapping=aes(x=displ,y=cty,fill=drv,group=drv)) +
  geom_boxplot()
m1 + facet_grid(.~class)

# additional control over aesthetics
d <- mpg
p1 <- ggplot(d,
             mapping=aes(x=displ,y=hwy)) +
  geom_point() + geom_smooth()
p1

# break out drive types ( adding in multiple components)
p1 <- ggplot(d,
             mapping=aes(x=displ,y=hwy,group=drv)) +
  geom_point() + geom_smooth()
p1

# break out with color
p1 <- ggplot(d,
             mapping=aes(x=displ,y=hwy,color=drv)) +
  geom_point() + geom_smooth()
p1

# change fill ( adding color to empy spaces available)
p1 <- ggplot(d,
             mapping=aes(x=displ,y=hwy,fill=drv)) +
  geom_point() + geom_smooth()
p1

# get both effects
p1 <- ggplot(d,
             mapping=aes(x=displ,y=hwy,fill=drv,color=drv)) +
  geom_point() + geom_smooth()

p1

# use aesthetics mappings within geoms to overide initial settings

p1 <- ggplot(data=d,mappings=aes(x=displ,y=hwy,col=drv)) +
  geom_point(data=d[d$drv=="4",]) + geom_smooth()
p1
