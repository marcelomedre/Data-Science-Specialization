library(plotly)
data("mtcars")

plot_ly(data = mtcars, x = mtcars$wt, y = mtcars$mpg, mode = "markers")

# Histogram
plot_ly(x = precip, type = "histogram")

# Boxplot
data("iris")
plot_ly(iris, y = iris$Petal.Length, color = iris$Species, type = "box")

# heatmap
terrain1 <- matrix(rnorm(10*100), nrow = 100, ncol = 100)
plot_ly(z = terrain1, type = "heatmap")

# 3D Surface
terrain2 <- matrix(sort(rnorm(100*100)), nrow = 100, ncol = 100)
plot_ly(z = terrain2, type = "surface")

# ggplot fan
set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000),]
p <- ggplot(data = d, aes(x = carat, y = price))+
  geom_point(aes(text = paste("Clarity:", clarity)), size = 4)+
  geom_smooth(aes(colour = cut, fill = cut)) +
  facet_wrap(~ cut)
(gg <- ggplotly(p))

