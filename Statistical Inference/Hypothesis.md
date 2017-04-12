# Hypothesis testing

Hypothesis testing is concerned with makind decisions using data.
A null hypothesis is specified that represents the status quo, usually H0.

Example

A respiratory disturbance index of more than $30$ events / hour, say, is considered evidence of severe sleep disordered breathing (SDB).
Suppose that in a sample of $100$ overweight subjects with other risk factors for sleep disordered breathing at a sleep clinic, the mean RDI was $32$ events / hour with a standard deviation of $10$ events / hour.
We might want to test the hypothesis that
$H_0 : \mu = 30$
$H_a : \mu > 30$
where $\mu$ is the population mean RDI.

Discussion

Consider a court of law; the null hypothesis is that the defendant is innocent
We require a standard on the available evidence to reject the null hypothesis (convict)
If we set a low standard, then we would increase the percentage of innocent people convicted (type I errors); however we would also increase the percentage of guilty people convicted (correctly rejecting the null)
If we set a high standard, then we increase the the percentage of innocent people let free (correctly accepting the null) while we would also increase the percentage of guilty people let free (type II errors)

Example
Consider our sleep example again
A reasonable strategy would reject the null hypothesis if X was larger than some constant, say C
Typically, C is chosen so that the probability of a Type I error, alpha, is .05 (or some other relevant constant)
alpha = Type I error rate = Probability of rejecting the null hypothesis when, in fact, the null hypothesis is correct

