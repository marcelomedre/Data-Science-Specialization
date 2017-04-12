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


# Binomial Distributions

#Example
choose(8,7)*0.5 ^ 8 + choose(8,8)*0.5 ^ 8

pbinom(6, size = 8, prob = 0.5, lower.tail = F)

# standard normal distributuion
x <- seq(-3, 3, length = 1000)
library(ggplot2)
g <- ggplot(data.frame(x = x, y = dnorm(x)), 
            aes(x = x, y = y)) + geom_line(size = 2)
g <- g + geom_vline(xintercept = -3 : 3, size = 2)
g

#Q1
qnorm(0.95, 0, 1)
#Q2
pnorm(x, mean = 1, sd = 0, lower.tail = FALSE)

pnorm(1160, mean = 1020, sd = 50, lower.tail = FALSE)
pnorm(2.8, lower.tail = FALSE)
qnorm(0.75, mean = 1020, sd = 50)

# Poisson distribution
ppois(3, lambda = 2.5 * 4)

#Example, Poisson approximation to the binomial
pbinom(2, size = 500, prob = .01)
ppois(2, lambda=500 * .01)

# Asymptopia
# Law of Large numbers
n <- 10000
means <- cumsum(rnorm(n)) / (1  : n)
library(ggplot2)
g <- ggplot(data.frame(x = 1 : n, y = means), aes(x = x, y = y)) 
g <- g + geom_hline(yintercept = 0) + geom_line(size = 2) 
g <- g + labs(x = "Number of obs", y = "Cumulative mean")
g

# Law of large numbers in action, coin flip

means <- cumsum(sample(0 : 1, n , replace = TRUE)) / (1  : n)
g <- ggplot(data.frame(x = 1 : n, y = means), aes(x = x, y = y)) 
g <- g + geom_hline(yintercept = 0.5) + geom_line(size = 2) 
g <- g + labs(x = "Number of obs", y = "Cumulative mean")
g

# Example CLT
nosim <- 1000
cfunc <- function(x, n) sqrt(n) * (mean(x) - 3.5) / 1.71
dat <- data.frame(
  x = c(apply(matrix(sample(1 : 6, nosim * 10, replace = TRUE), 
                     nosim), 1, cfunc, 10),
        apply(matrix(sample(1 : 6, nosim * 20, replace = TRUE), 
                     nosim), 1, cfunc, 20),
        apply(matrix(sample(1 : 6, nosim * 30, replace = TRUE), 
                     nosim), 1, cfunc, 30)
  ),
  size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(alpha = .20, binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)


# Flip of a coin
nosim <- 1000
cfunc <- function(x, n) 2 * sqrt(n) * (mean(x) - 0.5) 
dat <- data.frame(
  x = c(apply(matrix(sample(0:1, nosim * 10, replace = TRUE), 
                     nosim), 1, cfunc, 10),
        apply(matrix(sample(0:1, nosim * 20, replace = TRUE), 
                     nosim), 1, cfunc, 20),
        apply(matrix(sample(0:1, nosim * 30, replace = TRUE), 
                     nosim), 1, cfunc, 30)
  ),
  size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)

# Biased coin
nosim <- 1000
cfunc <- function(x, n) sqrt(n) * (mean(x) - 0.9) / sqrt(.1 * .9)
dat <- data.frame(
  x = c(apply(matrix(sample(0:1, prob = c(.1,.9), nosim * 10, replace = TRUE), 
                     nosim), 1, cfunc, 10),
        apply(matrix(sample(0:1, prob = c(.1,.9), nosim * 20, replace = TRUE), 
                     nosim), 1, cfunc, 20),
        apply(matrix(sample(0:1, prob = c(.1,.9), nosim * 30, replace = TRUE), 
                     nosim), 1, cfunc, 30)
  ),
  size = factor(rep(c(10, 20, 30), rep(nosim, 3))))
g <- ggplot(dat, aes(x = x, fill = size)) + geom_histogram(binwidth=.3, colour = "black", aes(y = ..density..)) 
g <- g + stat_function(fun = dnorm, size = 2)
g + facet_grid(. ~ size)

# Give a confidence interval for the average height of sons
library(UsingR);data(father.son); x <- father.son$sheight
(mean(x) + c(-1, 1) * qnorm(.975) * sd(x) / sqrt(length(x))) / 12


round(1 / sqrt(10 ^ (1 : 6)), 3)

# Binomial interval

.56 + c(-1, 1) * qnorm(.975) * sqrt(.56 * .44 / 100)
binom.test(56, 100)$conf.int

n <- 20; pvals <- seq(.1, .9, by = .05); nosim <- 1000
coverage <- sapply(pvals, function(p){
  phats <- rbinom(nosim, prob = p, size = n) / n
  ll <- phats - qnorm(.975) * sqrt(phats * (1 - phats) / n)
  ul <- phats + qnorm(.975) * sqrt(phats * (1 - phats) / n)
  mean(ll < p & ul > p)
})
ggplot(data.frame(pvals, coverage), aes(x = pvals, y = coverage)) + geom_line(size = 2) + geom_hline(yintercept = 0.95) + ylim(.75, 1.0)


n <- 100; pvals <- seq(.1, .9, by = .05); nosim <- 1000
coverage2 <- sapply(pvals, function(p){
  phats <- rbinom(nosim, prob = p, size = n) / n
  ll <- phats - qnorm(.975) * sqrt(phats * (1 - phats) / n)
  ul <- phats + qnorm(.975) * sqrt(phats * (1 - phats) / n)
  mean(ll < p & ul > p)
})
ggplot(data.frame(pvals, coverage), aes(x = pvals, y = coverage2)) + geom_line(size = 2) + geom_hline(yintercept = 0.95)+ ylim(.75, 1.0)


# Now let's look at $n=20$ but adding 2 successes and failures

n <- 20; pvals <- seq(.1, .9, by = .05); nosim <- 1000
coverage <- sapply(pvals, function(p){
phats <- (rbinom(nosim, prob = p, size = n) + 2) / (n + 4)
ll <- phats - qnorm(.975) * sqrt(phats * (1 - phats) / n)
ul <- phats + qnorm(.975) * sqrt(phats * (1 - phats) / n)
mean(ll < p & ul > p)
})

ggplot(data.frame(pvals, coverage), aes(x = pvals, y = coverage)) + geom_line(size = 2) + geom_hline(yintercept = 0.95)+ ylim(.75, 1.0)

# Poisson INterval
x <- 5; t <- 94.32; lambda <- x / t
round(lambda + c(-1, 1) * qnorm(.975) * sqrt(lambda / t), 3)
poisson.test(x, T = 94.32)$conf


# Simulating the Poisson coverage rate

# Let's see how this interval performs for lambda values near what we're estimating

lambdavals <- seq(0.005, 0.10, by = .01); nosim <- 1000
t <- 100
coverage <- sapply(lambdavals, function(lambda){
  lhats <- rpois(nosim, lambda = lambda * t) / t
  ll <- lhats - qnorm(.975) * sqrt(lhats / t)
  ul <- lhats + qnorm(.975) * sqrt(lhats / t)
  mean(ll < lambda & ul > lambda)
})
ggplot(data.frame(lambdavals, coverage), aes(x = lambdavals, y = coverage)) + geom_line(size = 2) + geom_hline(yintercept = 0.95)+ylim(0, 1.0)

lambdavals <- seq(0.005, 0.10, by = .01); nosim <- 1000
t <- 1000
coverage <- sapply(lambdavals, function(lambda){
  lhats <- rpois(nosim, lambda = lambda * t) / t
  ll <- lhats - qnorm(.975) * sqrt(lhats / t)
  ul <- lhats + qnorm(.975) * sqrt(lhats / t)
  mean(ll < lambda & ul > lambda)
})
ggplot(data.frame(lambdavals, coverage), aes(x = lambdavals, y = coverage)) + geom_line(size = 2) + geom_hline(yintercept = 0.95) + ylim(0, 1.0)