library(plotly)
plot_ly(z= ~volcano)


#Two main ways to get a plotyly object
#plotly() transforms data directly into the object

Data <- mpg
p0 <- plot_ly (data=data, x= ~displ, y = ~cty)
p0

# ggplotly turns grgplots into a plotyly object
p1 <- ggplot(data = data, mapping = aes(x=displ,y = cty)) + geom_point()
p1
ggplot(p1)

# can add "layers" with plotly
data <- txhousing
head(txhousing)
allcities <- txHousing%>%
  group_by(city %>%
  plot_ly ( x= ~date, y= ~median) %>%
  add_lines(alpha = 0.2, name = "Texan Cities", hoverinfo = "none")
  
  alCities %>% 
    filter(city== "Houston") %>%
    add_lines(name = "Houston")
  
  all cities %>%
    addfun(function(plot) {
      plot %>%
        filter(city == "Houston") %>%
        add_lines(name="Houston")}) %>%
    addfun(function(plot) {
      plot %>%
        filter(city == "Abilene") %>%
        add_lines(name="Abilene")})

  # Can also be used for 3D plots
plot_ly(data=iris,x=Sepal.Length, y=~Sepal.Width,z=Petal.Length,type="scatter3d",
            mode = "markers", size = ~Petal.Width,color=~Species)

# Add animations
df <- data.frame(
  x=c(1:5,4:1),
  y=c(1:5, 4:1),
  f = c(1:9))

p <- plot_ly(data=df, d= ~x,y=~y,frame = ~f,
             type = "scatter", transition = ~f,mode="markers", showlegend = TRUE)
p
