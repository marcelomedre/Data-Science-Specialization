#Statistical Inference

Generaring conclusin about a populations from a noisy sample. 
Extend knowledge beyond our data;

# Probability

Given a random experiment a probability measure is a population quantiy that summarizes the randomness.
Probability is a conceptual thing that exists in the population.
Prob - function takes a possible outcome from emperiment

Die - (1 to 6) A(1 or 2) and B(3 or 4) cannot both occur.
P(AuB) = P(A) + P(B)

* Rules Prob. must follow.
Prob that nothing occurs is 0.
Prob that somthing occurs is 1.
Prob. of something is 1 - prob opposite occurs. 
Prob. of at least 1 of two or more things that can not occur simultaneously (mutually exclusive) is the sum of their respective probs.
If an event A implies the occurence of B, the prob of A occuring is less than the prob of B.
(Event A inside event B)
For any 2 events the prob of at least one occurs is the sum of their probs minus their intersection.
P(AuB) = P(A) + P(B) - P(A/\B)

* Density and mass functions - density = bell curve 
Collect data used to estimate properties f the population.

* Random variable = numerical outcome of an experiment
* Discrete = you can count
* continuous = can take any value in a continum (prob to ranges the value can take)

Flip of a coin (0 - 1) discrete random variables
Roll of a die (1 to 6)

The web site traffic on a given day - discrete without upper limit (poisson distribution to model it)
Intelligence quotients for a sample children - continuos variable

* PMF - probability mass function - evaluated at a value corresponds to the prob that a random variable takes that value.
To be valid must satisfy:
1 - Always be larger than or equal to 0.
2 - The sum of the possible values that the random variable can take has to add up to one

PMF to die roll = (1/6)P(1) + (1/6)P(2) + (1/6)P(3) + (1/6)P(4) + (1/6)P(5) +(1/6)P(6) = 1
binomial, canonical and poisson.

Example PMF
Bernouilli distribution
X = 0 represents tails
X = 1 represents heads
 
p(x) = (1/2)^x(1/2)^(1-x) for x = 0,1 = for fare coin

p(x) = tetha^x(1 - tetha)^(1-x) for x = 0,1 = not for fare coin 


* Probability density function - function associated with continuos random variable.
to be valid = larger than or equal to zero everywhere.
The total area under it must be one.
areas under pdfs corresponds to probs for that random variable.

f(x) = 2x for 0<x<1
f(x) = 0 otherwise
PDF_01.R

Area  = 1 = valid PDF.

What is the prob that 75% or fewer of calls get adressed?
0.5625 or 56,25% (pbeta distribution)

* CDF = Cumulative distribution function (CDF) of a Random variable, X, returns the probability that the random
variable is less than or equal to the value of x.

F(x) = P(X =<x)
F(0.75) is the blue area R returns this pbeta (0.75, 2, 1)

* Survival function of a random variable X is defined as the prob that the random variable is greater that the value of x.
S(x) = P(X>x)
Notice that S(x) = 1 - F(x)

* Quantiles
if you were 95th percentile on an exam.
95% of people scored worse
5% scored better.

Definition: The (alpha)th quantile of a distribution with distribution function F is the point x(alpha)
so that
F(x(alpha)) = alpha
We want to solve 0.5 = F(x) = x^2
Resulting in the solution
sqrt(0.5)
R can approximate quantiles for you for common distributions
qbeta(0.5, 2, 1)

# Conditional Probability
The Prob of getting 1 in a die roll is 1/6.

def.let B an event so that P(B) > 0
Probabality of A given that the event B has occured
P(A|B) = P(A(intersect)B)/P(B)

In the case of A and B are unrelated, 
P(A|B) = P(A)P(B)/P(B) = P(A)

Example - die Roll
A={1}
B = {1, 3, 5}
P(one given that roll is odd) = P(A|B) = P(A)P(B)/P(B) = P(A)/P(B) = (1/6)/(3/6) = 1/3

* Baye's rule
Most famous uses of conditional probability
Reverse the rule
P(B|A), but we have P(A|B), Baye's rule allows you to do

Let + and - be the events that the result of a diagnostic test is positive or negative respectively
Let D and D^c be the event that the subject of the test has or does not have the disease respectively
Sensitivity is the probability that the test is positive given that the subject actually has the disease, P(+ | D)
Specificity is the probability that the test is negative given that the subject does not have the disease, P(- | D^c)

Positive predictive value = P(D | +)
Negative predictive value = P(D^c | -)

Prevalence of the desease = P(D)

Example
A study comparing the efficacy of HIV tests reports:
Sensitivity of 99.7% 
Specificity of 98.5%

Suppose that a subject, from a population with a .1% prevalence of HIV, 
receives a positive test result. What is the positive predictive value?

Mathematicaly we want P(D|+) given the sensitivity P(+|D) = .997
the specificity P(-|D^c) = 0.985 and the prevalence P(D) = .001

P(D|+) = 0.062
In this population a positive test result only suggests a 6% probability that the subject has the disease.

Likelihood ratios
P(D|+) = (P(+|D)P(D))/(P(+|D)P(D)+P(+|D^c)P(D^c))

* Independence
Event A is independent of event B

What is the probability of getting two consecutive heads?
A = {Head on flip 1} ~ P(A) = .5
B = {Head on flip 2} ~ P(B) = .5
A intersect B = {Head on flips 1 and 2}
P(A intersect B) = P(A)P(B) = .5 .5 = .25

* IID random variables

Random variables are said to be iid if they are independent and identically distributed
Independent: statistically unrelated from one and another
Identically distributed: all having been drawn from the same population distribution
iid random variables are the default model for random samples
Many of the important theories of statistics are founded on assuming that variables are iid
Assuming a random sample and iid will be the default starting point of inference for this class

# Expected Values
The process of making conclusions about populations from noisy data that was drawn from it.
Mean = center of the distribution - E(x) = sum(i to n) xi p(xi) idea of center of mass
Variance = how spread is the distribution

Example of a population mean:
Suppose a coin is flipped and X is declared 0 or 1 corresponding to a head or a tail, respectively.
What is the expected value of X? E[X] = .5 \times 0 + .5 \times 1 = .5
What is the expected value of X? E[X] = .5 \times 0 + .5 \times 1 = .5

What about a biased coin?
Suppose that a random variable, X, is so that P(X=1) = p and P(X=0) = (1 - p)
(This is a biased coin when p non eq 0.5)
What is its expected value? E[X] = 0 * (1 - p) + 1 * p = p

* Continuous Random variables
Uniform density 0 - 1, mean value = 0.5

Facts about expected values
are properties of distributions.
The center of this distributions is the same as that of the original distribution.
The distribution mean and the population of the distribution mean are the same. Estimator is unbiased.

Distribution of averages of a population will be centered in the same place as the distribution from the population itself.

Example - averages of x die rolls


Example - averages of x coin flips


# Sumarizing what we know
Expected values are properties of distributions
The population mean is the center of mass of population
The sample mean is the center of mass of the observed data
The sample mean is an estimate of the population mean
The sample mean is unbiased
The population mean of its distribution is the mean that it's trying to estimate
The more data that goes into the sample mean, the more concentrated its density / mass function is around the population mean