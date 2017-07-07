#Plotting Predictors

How the data look and interact with each other.

```{r}
rm(list = ls())
library(ISLR); library(ggplot2); library(caret)
data(Wage)
summary(Wage)
```

i.e. All men and all from the Middle Atlatic region.

Building training and testing sets.
```{r}
inTrain <- createDataPartition(y = Wage$wage, p = 0.7, list = FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training); dim(testing)
```

Feature plot

```{r}
featurePlot(x = training[,c("age", "education", "jobclass")],
            y = training$wage, plot = "pairs")
```

```{r}
qplot(age, wage, data = training)
qplot(age, wage, colour = jobclass, data = training)
```

## Add regression smoothers

```{r}
qq <- qplot(age, wage, colour = education, data = training)
qq + geom_smooth(method = "lm", formula = y ~ x )
```

## cut2, making factors (Hmisc package)
```{r}
library(Hmisc); library(grid); library(gridExtra); library(lattice)
cutWage <- cut2(training$wage, g = 3) # break factors based on quantiles groups
table(cutWage)

p1 <- qplot(cutWage, age, data = training, fill = cutWage, geom = c("boxplot"))
p1

p2 <- qplot(cutWage, age, data = training, fill = cutWage, geom = c("boxplot", "jitter"))
grid.arrange(p1, p2, ncol = 2)

```

## Tables
```{r}
t1 <- table(cutWage, training$jobclass)
t1
prop.table(t1,1)
```

here I see that 62% of the low wage jobs go, correspond to industrial, and 37%, 38% correspond to information. And so you can use that to get an idea of how those proportions change across different wage levels

## Density plots

```{r}
qplot(wage, colour = education, data = training, geom = "density")
```
