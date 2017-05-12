# Regression models week 2

# Estimation is useful, but we also need to know how to extend our estimates to 
# a population. This is the process of statistical inference. Our approach to
# statistical inference will be through a statistical model. At the bare minimum,
# we need a few distributional assumptions on the errors. 

# Statistical Linear Regression Models
# model Yi = B0 + B1Xi + ei
# ei = gaussian, assumed N(0, s^2)

# Interpreting coeficients

# often a (the values to change the intercept) is set to be average value of X,
# is interpreted as the expected response at the average X value.

# Linear Regression for prediction

# Example

# Data is diamond prices (Singapore dollars) and diamond weight in carats
# (standard measure of diamond mass, 0.2 $g$). To get the data use 
# library(UsingR); data(diamond)

library(UsingR)
data(diamond)
library(ggplot2)

g = ggplot(diamond, aes(x = carat, y = price))
g = g + xlab("Mass (carats)")
g = g + ylab("Price (SIN $)")
g = g + geom_point(size = 7, colour = "black", alpha=0.5)
g = g + geom_point(size = 5, colour = "blue", alpha=0.2)
g = g + geom_smooth(method = "lm", colour = "black")
g

# Fitting the lm model
fit <- lm(price ~ carat, data = diamond)
coef(fit)

summary(fit)
coef(fit)

# intercept = -259.62 which has no interpretable value.

## Getting a more interpretable intercept

fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
coef(fit2)

# slope = fit
# intercept = 500 SIn U$, thus $500.1 is the expected price for the averadge sized diamonds
# of the data (0.2042 carats)

fit3 <- lm(price ~ I(carat * 10), data = diamond)
coef(fit3)


## Predicting the price of a diaond

newx <- c(0.16, 0.27, 0.34)
coef(fit)[1] + coef(fit)[2] * newx
predict(fit, newdata = data.frame(carat = newx))

# Predicted values at the observed Xs (red) and at the new Xs (lines)
data(diamond)
plot(diamond$carat, diamond$price,  
     xlab = "Mass (carats)", 
     ylab = "Price (SIN $)", 
     bg = "lightblue", 
     col = "black", cex = 1.1, pch = 21,frame = FALSE)
abline(fit, lwd = 2)
points(diamond$carat, predict(fit), pch = 19, col = "red")
lines(c(0.16, 0.16, 0.12), 
      c(200, coef(fit)[1] + coef(fit)[2] * 0.16,
        coef(fit)[1] + coef(fit)[2] * 0.16))
lines(c(0.27, 0.27, 0.12), 
      c(200, coef(fit)[1] + coef(fit)[2] * 0.27,
        coef(fit)[1] + coef(fit)[2] * 0.27))
lines(c(0.34, 0.34, 0.12), 
      c(200, coef(fit)[1] + coef(fit)[2] * 0.34,
        coef(fit)[1] + coef(fit)[2] * 0.34))
text(newx, rep(250, 3), labels = newx, pos = 2)
