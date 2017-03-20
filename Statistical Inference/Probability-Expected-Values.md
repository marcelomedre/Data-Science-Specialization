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

Density and mass functions - density = bell curve 
Collect data used to estimate properties f the population.

Random variable = numerical outcome of an experiment
Discrete = you can count
continuous = can take any value in a continum (prob to ranges the value can take)

Flip of a coin (0 - 1) discrete random variables
Roll of a die (1 to 6)

The web site traffic on a given day - discrete without upper limit (poisson distribution to model it)
Intelligence quotients for a sample children - continuos variable

PMF - probability mass function - evaluated at a value corresponds to the prob that a random variable takes that value.
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
