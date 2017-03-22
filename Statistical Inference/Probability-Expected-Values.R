# Probability

# f(x) = 2x for 0<x<1
# f(x) = 0 otherwise
rm(list = ls())
x <- c(-0.5, 0, 1, 1, 1.5)
y <- c(0, 0, 2, 0, 0) 
plot(x, y, lwd = 3, frame = FALSE, type = "l")

1.5*0.75/2
pbeta(0.75,2,1)

plot(x, y, lwd = 3, frame = FALSE, type = "l")
polygon(c(0, .75, .75, 0), c(0, 0, 1.5, 0), lwd = 3, col = "lightblue")

# Whats theSurv Function and CDF from the density considered before?

pbeta(c(0.4,0.5,0.6), 2,1)

# Quantile
#Whats is the median distribution for our distribution? (triangulo)
# We want to solve 0.5 = F(x) = x^2
# Resulting in the solution
sqrt(0.5) # on about 50% of the days 70% of the phone calls or fewer get anwered
# R can approximate quantiles for you for common distributions
qbeta(0.5, 2, 1)

# Expected values
library(manipulate)
library(ggplot2)
library(UsingR); data(galton); 
library(reshape2)
longGalton <- melt(galton, measure.vars = c("child", "parent"))
g <- ggplot(longGalton, aes(x = value)) + geom_histogram(aes(y = ..density..,  fill = variable), binwidth=1, colour = "black") + geom_density(size = 2)
g <- g + facet_grid(. ~ variable)
g
myHist <- function(mu){
  g <- ggplot(galton, aes(x = child))
  g <- g + geom_histogram(fill = "salmon", 
                          binwidth=1, aes(y = ..density..), colour = "black")
  g <- g + geom_density(size = 2)
  g <- g + geom_vline(xintercept = mu, size = 2)
  mse <- round(mean((galton$child - mu)^2), 3)  
  g <- g + labs(title = paste('mu = ', mu, ' MSE = ', mse))
  g
}
manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))

# flip a coin
ggplot(data.frame(x = factor(0 : 1), y = c(.5, .5)), aes(x = x, y = y)) + geom_bar(stat = "identity", colour = 'black', fill = "lightblue")
# Expected avg value = 0.5

# die is rolled
ggplot(data.frame(x = factor(1 : 6), y = rep(1/6, 6)), aes(x = x, y = y)) + geom_bar(stat = "identity", colour = 'black', fill = "lightblue")
# Expected avg value = 3.5

g <- ggplot(data.frame(x = c(-0.25, 0, 0, 1, 1, 1.25),
                       y = c(0, 0, 1, 1, 0, 0)),
            aes(x = x, y = y))
g <- g + geom_line(size = 2, colour = "black")
g <- g + labs(title = "Uniform density")
g  

library(ggplot2)
nosim <- 10000; n <- 10
dat <- data.frame(
  x = c(rnorm(nosim), apply(matrix(rnorm(nosim * n), nosim), 1, mean)),
  what = factor(rep(c("Obs", "Mean"), c(nosim, nosim))) 
)
ggplot(dat, aes(x = x, fill = what)) + geom_density(size = 2, alpha = .2)

#Example - averages of x die rolls
dat <- data.frame(
  x = c(sample(1 : 6, nosim, replace = TRUE),
        apply(matrix(sample(1 : 6, nosim * 2, replace = TRUE), 
                     nosim), 1, mean),
        apply(matrix(sample(1 : 6, nosim * 3, replace = TRUE), 
                     nosim), 1, mean),
        apply(matrix(sample(1 : 6, nosim * 4, replace = TRUE), 
                     nosim), 1, mean)
  ),
  size = factor(rep(1 : 4, rep(nosim, 4))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.25, colour = "black") 
g + facet_grid(. ~ size)


# Example - averages of x coin flips
dat <- data.frame(
  x = c(sample(0 : 1, nosim, replace = TRUE),
        apply(matrix(sample(0 : 1, nosim * 10, replace = TRUE), 
                     nosim), 1, mean),
        apply(matrix(sample(0 : 1, nosim * 20, replace = TRUE), 
                     nosim), 1, mean),
        apply(matrix(sample(0 : 1, nosim * 30, replace = TRUE), 
                     nosim), 1, mean)
  ),
  size = factor(rep(c(1, 10, 20, 30), rep(nosim, 4))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth = 1 / 12, colour = "black"); 
g + facet_grid(. ~ size)
