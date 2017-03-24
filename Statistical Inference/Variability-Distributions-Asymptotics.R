# Distributions with increasing variance
library(ggplot2)
xvals <- seq(-10, 10, by = .01)
dat <- data.frame(
  y = c(
    dnorm(xvals, mean = 0, sd = 1),
    dnorm(xvals, mean = 0, sd = 2),
    dnorm(xvals, mean = 0, sd = 3),
    dnorm(xvals, mean = 0, sd = 4)
  ),
  x = rep(xvals, 4),
  factor = factor(rep(1 : 4, rep(length(xvals), 4)))
)
ggplot(dat, aes(x = x, y = y, color = factor)) + geom_line(size = 2)    

#Simulating from a population with variance 1

library(ggplot2)
nosim <- 10000; 
dat <- data.frame(
  x = c(apply(matrix(rnorm(nosim * 10), nosim), 1, var),
        apply(matrix(rnorm(nosim * 20), nosim), 1, var),
        apply(matrix(rnorm(nosim * 30), nosim), 1, var)),
  n = factor(rep(c("10", "20", "30"), c(nosim, nosim, nosim))) 
)
ggplot(dat, aes(x = x, fill = n)) + geom_density(size = 2, alpha = .2) + geom_vline(xintercept = 1, size = 2) 


# Variances of x die rolls

dat <- data.frame(
  x = c(apply(matrix(sample(1 : 6, nosim * 10, replace = TRUE), 
                     nosim), 1, var),
        apply(matrix(sample(1 : 6, nosim * 20, replace = TRUE), 
                     nosim), 1, var),
        apply(matrix(sample(1 : 6, nosim * 30, replace = TRUE), 
                     nosim), 1, var)
  ),
  size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.3, colour = "black") 
g <- g + geom_vline(xintercept = 2.92, size = 2)
g + facet_grid(. ~ size)

# Simulation example

#Standard normals have variance 1; 
# means of n standard normals have 
# standard deviation 1/sqrt{n}
  
nosim <- 1000
n <- 10
sd(apply(matrix(rnorm(nosim * n), nosim), 1, mean))
1 / sqrt(n)


#Simulation example

# Standard uniforms have variance $1/12$; means of random samples of $n$ uniforms have sd $1/\sqrt{12 \times n}$
  
nosim <- 1000
n <- 10
sd(apply(matrix(runif(nosim * n), nosim), 1, mean))
1 / sqrt(12 * n)


#Poisson(4) have variance $4$; means of random samples of $n$ Poisson(4) have sd $2/\sqrt{n}$
  
nosim <- 1000
n <- 10
sd(apply(matrix(rpois(nosim * n, 4), nosim), 1, mean))
2 / sqrt(n)

# Fair coin flips have variance $0.25$; means of random samples of $n$ coin flips have sd $1 / (2 \sqrt{n})$
  
nosim <- 1000
n <- 10
sd(apply(matrix(sample(0 : 1, nosim * n, replace = TRUE),
                nosim), 1, mean))
1 / (2 * sqrt(n))

# Data example
library(UsingR); data(father.son); 
x <- father.son$sheight
n<-length(x)

g <- ggplot(data = father.son, aes(x = sheight)) 
g <- g + geom_histogram(aes(y = ..density..), fill = "lightblue", binwidth=1, colour = "black")
g <- g + geom_density(size = 2, colour = "black")
g

round(c(var(x), var(x) / n, sd(x), sd(x) / sqrt(n)),2)
g
