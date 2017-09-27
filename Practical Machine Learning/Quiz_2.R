library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

library(Hmisc)
library(dplyr)
library(gridExtra)

training <- mutate(training, index = 1:nrow(training))
cutIndex <- cut2(training$index, g = 10)
breaks <- 10

qplot(index, CompressiveStrength, data = training, color = cut2(training$Cement, g = breaks))

# Question 3
rm(list = ls())
library(AppliedPredictiveModeling)
data(concrete)
library(caret)
set.seed(1000)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

hist(training$Superplasticizer, breaks = 20)

hist(training$Superplasticizer+1, breaks = 20)

#Question 4
rm(list = ls())
library(caret)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
set.seed(3433)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

IL_str <- grep("^IL", colnames(training), value = TRUE)
preProc <- preProcess(training[,IL_str], method = "pca", thresh = 0.8)
preProc$rotation
# we can see that there are 7 components required to achieve 80% of the variance

#Question 5
rm(list = ls())
library(caret)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
set.seed(3433)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

set.seed(3433)
## grep the predictors starting with 'IL'
IL_str <- grep("^IL", colnames(training), value = TRUE)
## make a subset of these predictors
predictors_IL <- predictors[, IL_str]
df <- data.frame(diagnosis, predictors_IL)
inTrain = createDataPartition(df$diagnosis, p = 3/4)[[1]]
training = df[inTrain, ]
testing = df[-inTrain, ]

## train the data using the first method
modelFit <- train(diagnosis ~ ., method = "glm", data = training)
predictions <- predict(modelFit, newdata = testing)
## get the confustion matrix for the first method
C1 <- confusionMatrix(predictions, testing$diagnosis)
print(C1)

A1 <- C1$overall[1]

## do similar steps with the caret package
modelFit <- train(training$diagnosis ~ ., method = "glm", preProcess = "pca", 
                  data = training, trControl = trainControl(preProcOptions = list(thresh = 0.8)))
C2 <- confusionMatrix(testing$diagnosis, predict(modelFit, testing))
print(C2)

A2 <- C2$overall[1]
