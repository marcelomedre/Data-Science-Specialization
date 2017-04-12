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

# Module 6 Distributions

* The Bernoulli Distribution
arises as a result of a binary outcome
coin flip 1 for tail and 0 for heads with probs p and p-1 respectively.
PMF = P(X = x) = p^x (1 - p)^{1 - x}
The mean of a Bernoulli random variable is p and the variance is p(1 - p).
If we let X be a Bernoulli random variable, it is typical to call X=1 as a "success"
and X=0 as a "failure".

* Binomial trials
The binomial random variables are obtained as the sum of iid Bernoulli trials

Example:
Suppose a friend has 8 children, 7 of which are girls.
If each gender has an independent $50$% probability for each birth, what's the probability of getting 7
or more girls out of 8 births? 
(8 (0.5)^7(1~)^1 + (8) (0.5)^8 (1-0.5)^0 ~0.04
(7)                (8) 
R codes

* Normal distribution
Normal or Gaussian distribution with mean mu and variance s^2
E(X) = mu and Var(X) = s^2
X ~ N(mu, s^2)
se mu = 0 and s = 1 = standard normal distribution

R standard normal distribution
1 sd from the mean = 34 density should lie on each side
from -1 to +1 = total area = 68%

from -2 to +2 = total area = 95%
2.5 % in either tail used in confidence intervals. 

from -3 to +3 = total area = 99% of the mass

More facts about the normal density
Approximately $68%$, $95%$ and $99%$ of the normal density lies within $1$, $2$ and $3$ standard deviations from the mean, respectively
$-1.28$, $-1.645$, $-1.96$ and $-2.33$ are the $10^{th}$, $5^{th}$, $2.5^{th}$ and $1^{st}$ percentiles of the standard normal distribution respectively
By symmetry, $1.28$, $1.645$, $1.96$ and $2.33$ are the $90^{th}$, $95^{th}$, $97.5^{th}$ and $99^{th}$ percentiles of the standard normal distribution respectively

Quantiles -1.96 ~ 2.5%
	  +1.96 ~ 2.5% mass
	  
Non standard normal mu - 1.96 sigma

Question whats is the 95%th of a N(mu, s^2) distribution?
qnorm(0.95, mean = mu, sd = sd)

whats is the probability that a N(mu, s^2) RV is larger than x?
pnorm(x, mean = mu, sd = sigma, lower.tail = FALSE)
x - mu / sd

Assume that the number of daily ad clicks for a company is (approximately) 
normally distributed with a mean of 1020 and a standard deviation of 50. 
What's the probability of getting more than 1,160 clicks in a day?

It's not very likely, 1,160 is r (1160 - 1020) / 50 standard deviations from the mean

pnorm(1160, mean = 1020, sd = 50, lower.tail = FALSE)
pnorm(2.8, lower.tail = FALSE)

What number of daily ad clicks would represent the one where 75% of days have fewer clicks 
(assuming days are independent and identically distributed)?

qnorm(0.75, mean = 1020, sd = 50)

* Poisson distribution
Used to model counts
mean is lambda
variance of this distribution is also lambda

Mean = Variance

Modeling count data
Modeling event-time survival data
Modeling contingency tables
Approximating binomials when n is large and p is small
Used to model rates
X ~ Poisson (lambda*t)
lambda = expected count per unit time
t = total monitoring time

Example
The number of people that show up at a bus stop is Poisson with a mean of $2.5$ per hour.

If watching the bus stop for 4 hours, what is the probability that $3$ or fewer people
show up for the whole time?

pois(3, lambda = 2.5 * 4)

When $n$ is large and $p$ is small the Poisson distribution is an accurate approximation
to the binomial distribution.

Example, Poisson approximation to the binomial
We flip a coin with success probablity $0.01$ five hundred times.
We flip a coin with success probablity $0.01$ five hundred times.
pbinom(2, size = 500, prob = .01)
ppois(2, lambda=500 * .01)


# Asymptopia
Asymptotics is the term for the behavior of statistics as the sample size (or some other relevant quantity)
limits to infinity (or some other relevant number).
Asymptotics are incredibly useful for simple statistical inference and approximations.
Asymptotics generally give no assurances about finite sample performance.
Asymptotics form the basis for frequency interpretation of probabilities (the long run proportion of times an event occurs).

* Limits of Random Variables
These results allow us to talk about the large sample distribution of sample means of a collection of iid observations.
The first of these results we intuitively know - law of large numbers
	It says that the average limits to what it's estimating, the population mean.
	It's called the Law of Large Numbers
Example:X_n could be the average of the result of n coin flips (i.e. the sample proportion of heads)
As we flip a fair coin over and over, it eventually converges to the true probability of a head The LLN forms the basis of frequency style thinking

An estimator is consistent if it converges to what you want to estimate
The LLN says that the sample mean of iid sample is consistent for the population mean
Typically, good estimators are consistent; it's not too much to ask that if we go to the trouble of collecting an infinite amount of data that we get the right answer
The sample variance and the sample standard deviation of iid random variables are consistent as well

* The Central Limit Theorem
The Central Limit Theorem (CLT) is one of the most important theorems in statistics
For our purposes, the CLT states that the distribution of averages of iid variables (properly normalized) becomes that of a standard normal as the sample size increases
The CLT applies in an endless variety of settings

Examples CLT
Simulate a standard normal random variable by rolling $n$ (six sided)
Let $X_i$ be the outcome for die $i$
Then note that $\mu = E[X_i] = 3.5$
$Var(X_i) = 2.92$
SE $\sqrt{2.92 / n} = 1.71 / \sqrt{n}$
Let's roll $n$ dice, take their mean, subtract off 3.5, and divide by $1.71 / \sqrt{n}$ and repeat this over and over

flip a Coin

Let $X_i$ be the $0$ or $1$ result of the $i^{th}$ flip of a possibly unfair coin
The sample proportion, say $\hat p$, is the average of the coin flips
$E[X_i] = p$ and $Var(X_i) = p(1-p)$
Standard error of the mean is $\sqrt{p(1-p)/n}$
Then $$ \frac{\hat p - p}{\sqrt{p(1-p)/n}} $$ will be approximately normally distributed
Let's flip a coin $n$ times, take the sample proportion of heads, subtract off .5 and multiply the result by $2 \sqrt{n}$ (divide by $1/(2 \sqrt{n})$)

biased coin
p of heads = 0.9

Galton's quincunx

# Confidence Intervals
According to the CLT, the sample mean, $\bar X$, is approximately normal with mean $\mu$ and sd $\sigma / \sqrt{n}$
$\mu + 2 \sigma /\sqrt{n}$ is pretty far out in the tail (only 2.5% of a normal being larger than 2 sds in the tail)
Similarly, $\mu - 2 \sigma /\sqrt{n}$ is pretty far in the left tail (only 2.5% chance of a normal being smaller than 2 sds in the tail)
So the probability $\bar X$ is bigger than $\mu + 2 \sigma / \sqrt{n}$ or smaller than $\mu - 2 \sigma / \sqrt{n}$ is 5%
Or equivalently, the probability of being between these limits is 95%
The quantity $\bar X \pm 2 \sigma /\sqrt{n}$ is called a 95% interval for $\mu$
The 95% refers to the fact that if one were to repeatedly get samples of size $n$, about 95% of the intervals obtained would contain $\mu$
The 97.5th quantile is 1.96 (so I rounded to 2 above)
90% interval you want (100 - 90) / 2 = 5% in each tail
So you want the 95th percentile (1.645)

Give a confidence interval for the average height of sons
library(UsingR);data(father.son); x <- father.son$sheight
(mean(x) + c(-1, 1) * qnorm(.975) * sd(x) / sqrt(length(x))) / 12
Example

Your campaign advisor told you that in a random sample of 100 likely voters, 56 intent to vote for you.
Can you relax? Do you have this race in the bag?
Without access to a computer or calculator, how precise is this estimate?
1/sqrt(100)=0.1 so a back of the envelope calculation gives an approximate 95% interval of (0.46, 0.66)
Not enough for you to relax, better go do more campaigning!
Rough guidelines, 100 for 1 decimal place, 10,000 for 2, 1,000,000 for 3.
round(1 / sqrt(10 ^ (1 : 6)), 3)

Binomial interval

.56 + c(-1, 1) * qnorm(.975) * sqrt(.56 * .44 / 100)
binom.test(56, 100)$conf.int

* Poisson Interval
A nuclear pump failed 5 times out of 94.32 days, give a 95% confidence interval for the failure rate per day?
$X \sim Poisson(\lambda t)$.
Estimate $\hat \lambda = X/t$
$Var(\hat \lambda) = \lambda / t$
$\hat \lambda / t$ is our variance estimate

Simulating the Poisson coverage rate

Let's see how this interval performs for lambda values near what we're estimating

lambdavals <- seq(0.005, 0.10, by = .01); nosim <- 1000
t <- 100
coverage <- sapply(lambdavals, function(lambda){
  lhats <- rpois(nosim, lambda = lambda * t) / t
  ll <- lhats - qnorm(.975) * sqrt(lhats / t)
  ul <- lhats + qnorm(.975) * sqrt(lhats / t)
  mean(ll < lambda & ul > lambda)
})

Summary

The LLN states that averages of iid samples converge to the population means that they are estimating
The CLT states that averages are approximately normal, with distributions
centered at the population mean
with standard deviation equal to the standard error of the mean
CLT gives no guarantee that $n$ is large enough
Taking the mean and adding and subtracting the relevant normal quantile times the SE yields a confidence interval for the mean
Adding and subtracting 2 SEs works for 95% intervals
Confidence intervals get wider as the coverage increases (why?)
Confidence intervals get narrower with less variability or larger sample sizes
The Poisson and binomial case have exact intervals that don't require the CLT
But a quick fix for small sample size binomial calculations is to add 2 successes and failures
