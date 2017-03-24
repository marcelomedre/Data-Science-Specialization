# Variability, Distributions and Asymptotics

* Variability
Population mean where the distribution is centered.
Variance = measure of the spread out o the mean.
Var (X) = E((X-mu)^2) = E(X^2) - E(X)^2

square root of variance = standard deviation
Expressed in same units of the measures

Example:
E(X) = 3.5 (die roll)
E(X^2) = 15.17

Var(X) = E(X^2) - E(X)^2 ~ 2.92

What's the variance of the toss of a coin with probability of heads (1) of p?
E(X) = 0 x (1-p)+1xp = p
E(X^2) = E(X) = p
Var(X) = p - p^2 = p(1-p)

Distributions with increasing variance - R code
Salmon = normal distrib variance 1

The sample variance
The population variance is the expected square of distance of a random variable from the population around
the population mean. 
The sample variance is the average square of distance of the observed observations minus the sample mean. 

That distribution has a expected value and that expected value is the population variance 
that the sample variance is trying to estimate. And as you collect more and more data, 
the distribution of the sample variance is going to get more concentrate, concentrated around the population
variance it's trying to estimate. And then I also simply want to remind you that the square root of the sample
variance is the sample.

Simulating an Experiment - R code

showing the distribution its center of mass will be 1.
The variance gets more concentrated = more data data is going to yield a better, more concentrated estimate
around what the sample variance is trying to estimate. In this case, they're all trying to estimate one 
cause they're sample from a population with variance one.

Die roll expriments - R code
Recall that earlier on in the lecture we found that the variance of a die roll was 2.92. 
The variance is a good estimate of the population variance. That as we collect more data, 
the distribution of the sample variance gets more concentrated about what it's trying to 
estimate and that it's centered in the right place.

Standard Deviation
The average of random sample from a pop is itself a random variable

So imagine a population that has mean mew and variance sigma squared, so measure of spread, sigma squared. 
If we were to draw a random sample from that population and take the variance, that is an estimate of sigma
squared. If we were to take the mean that's an estimate of mu.

# Data example
Values results
var(x) = 7.92 - variability of the son's height
var(x)/n = 0.01 - no longer talking about variablity of the height, it is talking about
variability in averages of ten heights
sd(x) = 2.81 - variability of the son's height (inches)
sd(x) / sqrt(n) = 0.09 - most meaningful = std error std deviation in the distribution of averages in n heights

* Summarizing what we know about variances

The sample variance estimates the population variance.
The distribution of the sample variance is centered at what its estimating.
It gets more concentrated around the population variance with larger sample sizes.
The variance of the sample mean is the population variance divided by n.
The square root is the standard error.
It turns out that we can say a lot about the distribution of averages from random samples, even though we only get one to look at in a given data set.

