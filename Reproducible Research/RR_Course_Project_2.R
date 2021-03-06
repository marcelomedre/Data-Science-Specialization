# RR - Course Project - 2
setwd("C:/Users/Marcelo/Desktop/Data Science/Data-Science-Specialization/Reproducible Research/")
destfile="./NOAA.csv.bz2" 
fileURL <-"https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"   
download.file(fileURL ,destfile,method="auto")

NOAA <- read.csv("NOAA.csv.bz2", header = TRUE, stringsAsFactors = FALSE)


str(NOAA)
head(NOAA)

# There are several variables that will not be used in this project
# I will subset the loaded data set.
# The variables we will use are:
# EVTYPE as a measure of event type (e.g. tornado, flood, etc.)
# FATALITIES as a measure of harm to human health
# INJURIES as a measure of harm to human health
# PROPDMG as a measure of property damage and hence economic damage in USD
# PROPDMGEXP as a measure of magnitude of property damage (e.g. thousands, millions USD, etc.)
# CROPDMG as a measure of crop damage and hence economic damage in USD
# CROPDMGEXP as a measure of magnitude of crop damage (e.g. thousands, millions USD, etc.)

vars <- c("EVTYPE", "FATALITIES", "INJURIES", "PROPDMG", "PROPDMGEXP", "CROPDMG",
          "CROPDMGEXP")
NOAA_dat <- NOAA[vars]

# Check for missing values NA's
sum(is.na(NOAA_dat)) # no NA's

# Economic values are stored  in separated columns described with letters:
# H = Hundreds, K = Thousands, M = Millions, B = Billions. Calculations of the total
# value could be trick:

exp <- function(e){
  if(e %in% c("h","H"))
    return(2)
  else if(e %in% c("k","K"))
    return(3)
  else if(e %in% c("m","M"))
    return(6)
  else if(e %in% c("b","B"))
    return(9)
  else if(!is.na(as.numeric(e)))
    return(as.numeric(e))
  else if (e %in% c("", "-", "?", "+"))
    return(0)
  else{
    stop("invalid Value.")
  }
}

# Assinging values to Property damages and crop damages
propExp <- suppressWarnings(sapply(NOAA_dat$PROPDMGEXP, FUN = exp))
NOAA_dat$PropDamage <- NOAA_dat$PROPDMG*(10**propExp)
cropExp <-  suppressWarnings(sapply(NOAA_dat$CROPDMGEXP, FUN = exp))
NOAA_dat$CropDamage <- NOAA_dat$CROPDMG*(10**propExp)

# Removing unused columns

NOAA_dat$PROPDMG <- NULL
NOAA_dat$PROPDMGEXP <- NULL
NOAA_dat$CROPDMG <- NULL
NOAA_dat$CROPDMGEXP <- NULL

#Your data analysis must address the following questions:
  
# Across the United States, which types of events (as indicated in the EVTYPE variable) are most harmful with respect to population health?

library(dplyr)
library(ggplot2)
library(gridExtra)

fatality_events <- NOAA_dat %>%
  group_by(EVTYPE) %>%
  summarise(Fatalities = sum(FATALITIES),
            Percentage = round(Fatalities/sum(NOAA_dat$FATALITIES)*100,2))%>%
  arrange(desc(Fatalities)) %>%
  head(10)

injury_events <- NOAA_dat %>%
  group_by(EVTYPE) %>%
  summarise(Injuries = sum(INJURIES),
            Percentage = round(Injuries/sum(NOAA_dat$INJURIES)*100,2))%>%
  arrange(desc(Injuries)) %>%
  head(10)

p1 <- ggplot(data = fatality_events, aes(x = reorder(EVTYPE, Fatalities), y = Fatalities,
                           fill = Fatalities, label = round(Percentage,2)))+
  geom_bar(stat = "identity")+
  coord_flip()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("Event Type")+
  ylab("Number of Fatalities")+
  ggtitle("Top 10 Events with Higest Fatalities in the US from 1950 to 2011")+
  theme(legend.position="none")+
  geom_label(aes(fill = Fatalities), colour = "white", fontface = "bold")


p2 <- ggplot(data = injury_events, aes(x = reorder(EVTYPE, Injuries), y = Injuries,
                                         fill = Injuries, label = round(Percentage,2)))+
  geom_bar(stat = "identity")+
  coord_flip()+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("Event Type")+
  ylab("Number of Injuries")+
  ggtitle("Top 10 Events with Higest Injuries in the US from 1950 to 2011")+
  theme(legend.position="none")+
  geom_label(aes(fill = Injuries), colour = "white")

grid.arrange(p1, p2, nrow = 2)

# Tornados are responsible for the highest Fatalities and Injuries in the last 61 years in the US
# reponsible for ~ 37 % of the Fatalities and 65% of the injuries.

# In the fatalitites case, Excessive heat, flash food, heat and lightning complete the top 5 events
# accounting for more than 67 % of the fatalities.


# Across the United States, which types of events have the greatest economic consequences?

NOAA_dat$TotalDMG <- NOAA_dat$PropDamage + NOAA_dat$CropDamage

TotalDMG <- NOAA_dat %>%
  group_by(EVTYPE) %>%
  summarise(Total = sum(TotalDMG),
            Percentage = round(Total/sum(NOAA_dat$TotalDMG)*100,2))%>%
  arrange(desc(Total)) %>%
  head(10)

ggplot(data = TotalDMG, aes(x = reorder(EVTYPE, -Total), y = Total/1000000000,
                                       fill = Total, label = round(Percentage,2)))+
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("Event Type")+
  ylab("Expense in U$ / billions")+
  ggtitle("Top 10 Events Most Expensive events in the US from 1950 to 2011")+
  theme(legend.position="none")+
  geom_label(aes(fill = Total), colour = "white")

proDMG <- NOAA_dat %>%
  group_by(EVTYPE) %>%
  summarise(Total = sum(PropDamage),
            Percentage = round(Total/sum(NOAA_dat$PropDamage)*100,2))%>%
  arrange(desc(Total)) %>%
  head(10)

ggplot(data = proDMG, aes(x = reorder(EVTYPE, -Total), y = Total/1000000000,
                                  fill = Total, label = round(Percentage,2)))+
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("Event Type")+
  ylab("Expense in U$ / billions")+
  ggtitle("Top 10 Most Expensive Properties Events in the US from 1950 to 2011")+
  theme(legend.position="none")+
  geom_label(aes(fill = Total), colour = "white")

cropDMG <- NOAA_dat %>%
  group_by(EVTYPE) %>%
  summarise(Total = sum(CropDamage),
            Percentage = round(Total/sum(NOAA_dat$CropDamage)*100,2))%>%
  arrange(desc(Total)) %>%
  head(10)

ggplot(data = cropDMG, aes(x = reorder(EVTYPE, -Total), y = Total/1000000000,
                                fill = Total, label = round(Percentage,2)))+
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))+
  xlab("Event Type")+
  ylab("Expense in U$ / billions")+
  ggtitle("Top 10 Most Expensive Crop Events in the US from 1950 to 2011")+
  theme(legend.position="none")+
  geom_label(aes(fill = Total), colour = "white")


