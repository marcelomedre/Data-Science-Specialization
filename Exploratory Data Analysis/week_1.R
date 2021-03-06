<<<<<<< HEAD
getwd()
setwd("C:/Users/Marcelo/Desktop/Coursera/datasciencecoursera/Exploratory Data Analysis")

load.libraries <- c('data.table', 'ggplot2', 'dplyr', 'openair')
install.lib <- load.libraries[!load.libraries %in% installed.packages()]
for(libs in install.lib) install.packages(libs, dependences = TRUE)
sapply(load.libraries, require, character = TRUE)

pollution <- read.csv("avgpm25.csv", 
                      colClasses = c("numeric", "character","factor", "numeric",
                                     "numeric"))
head(pollution)

# Do any counties exceed the standard of 12 ug/m3?
# Five number summary
# Boxplots
# Histogram
# Density plots
# Barplot

summary(pollution)
summary(pollution$pm25)

# Max > standard so we might have someone over the standard

boxplot(pollution$pm25, col = "green")

hist(pollution$pm25, col = "green")
rug(pollution$pm25) # plot all points - give and idea about the bulk of the data

hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h=12, col = "red")


hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)


barplot(table(pollution$region), col = "wheat", main = "Number of columns")

# 2D data
boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

with(pollution, plot(latitude, pm25))
abline(h = 12, lwd =2, lty = 2)

with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd =2, lty = 2)


par(mfrow = c(1,2), mar = c(5,4,2,1))
with(subset(pollution, region = "west"),plot(latitude, pm25, main = "WEST"))
with(subset(pollution, region = "east"),plot(latitude, pm25, main = "EAST"))
=======
getwd()
setwd("C:/Users/Marcelo/Desktop/Coursera/datasciencecoursera/Exploratory Data Analysis")

load.libraries <- c('data.table', 'ggplot2', 'dplyr', 'openair')
install.lib <- load.libraries[!load.libraries %in% installed.packages()]
for(libs in install.lib) install.packages(libs, dependences = TRUE)
sapply(load.libraries, require, character = TRUE)

pollution <- read.csv("avgpm25.csv", 
                      colClasses = c("numeric", "character","factor", "numeric",
                                     "numeric"))
head(pollution)

# Do any counties exceed the standard of 12 ug/m3?
# Five number summary
# Boxplots
# Histogram
# Density plots
# Barplot

summary(pollution)
summary(pollution$pm25)

# Max > standard so we might have someone over the standard

boxplot(pollution$pm25, col = "green")

hist(pollution$pm25, col = "green")
rug(pollution$pm25) # plot all points - give and idea about the bulk of the data

hist(pollution$pm25, col = "green", breaks = 100)
rug(pollution$pm25)

boxplot(pollution$pm25, col = "blue")
abline(h=12, col = "red")


hist(pollution$pm25, col = "green")
abline(v = 12, lwd = 2)
abline(v = median(pollution$pm25), col = "magenta", lwd = 4)


barplot(table(pollution$region), col = "wheat", main = "Number of columns")

# 2D data
boxplot(pm25 ~ region, data = pollution, col = "red")

par(mfrow = c(2,1), mar = c(4,4,2,1))
hist(subset(pollution, region == "east")$pm25, col = "green")
hist(subset(pollution, region == "west")$pm25, col = "green")

with(pollution, plot(latitude, pm25))
abline(h = 12, lwd =2, lty = 2)

with(pollution, plot(latitude, pm25, col = region))
abline(h = 12, lwd =2, lty = 2)


par(mfrow = c(1,2), mar = c(5,4,2,1))
with(subset(pollution, region = "west"),plot(latitude, pm25, main = "WEST"))
with(subset(pollution, region = "east"),plot(latitude, pm25, main = "EAST"))
>>>>>>> 5cf60613da10e42af82cb34906b4e4bd3ccc2903
