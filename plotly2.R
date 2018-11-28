# Plotly
# november 27 2018
# JSC

# plotly : A way to create interactive graphs. useful online graphs, and identifying individual data points easily
library(plotly)
plot_ly(z= ~volcano)

# two main ways to get a plotly object

# plot_ly() transform data directly into the object

data <- mpg
p0 <- plot_ly (data=data, x = ~displ, y = ~cty)
p0

#ggplotly() turns ggplots into a plotly object
 p1 <- ggplot(data=data,mapping = aes(x=displ, y=cty)) + geom_point()
p1 
ggplotly(p1)
