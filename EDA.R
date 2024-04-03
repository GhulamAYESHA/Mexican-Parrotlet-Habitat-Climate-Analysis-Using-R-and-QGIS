# Load required libraries
library(leaflet)
library(dplyr)
library(ggplot2)
library(sf)
library(rgdal)
library(raster)
library(sp)
library(ggspatial)
library(tidyverse)
library(mapview)

data <- read.csv("data.csv", header = TRUE, sep = ",")

#Exploratory Data Analysis (EDA)
# Summary statistics
summary(data)

# Correlation matrix
cor(data[, c("Presence", "wc2.1_10m_tavg_01", "wc2.1_10m_prec_01")])

# Scatter plot
ggplot(data, aes(x = wc2.1_10m_tavg_01, y = wc2.1_10m_prec_01)) +
  geom_point(aes(color = Presence)) +
  labs(x = "Average Temperature", y = "Precipitation")

# Convert Presence column to factor
data$Presence <- factor(data$Presence, levels = c(0, 1), labels = c("Absence", "Presence"))

# Plot histogram of alt (altitude) variable
ggplot(data, aes(alt)) +
  geom_histogram(fill = "steelblue", color = "white") +
  labs(x = "Altitude", y = "Frequency") +
  ggtitle("Distribution of Altitude")

# Plot scatter plot of Latitude vs. Longitude
ggplot(data, aes(x = Long, y = Lat, color = Presence)) +
  geom_point(alpha = 0.7) +
  labs(x = "Longitude", y = "Latitude") +
  ggtitle("Presence of Mexican Parrotlet by Location")


# Density plot of Altitude
ggplot(data, aes(x = alt, fill = factor(Presence))) +
  geom_density(alpha = 0.5) +
  labs(title = "Density plot of Altitude") +
  xlab("Altitude") +
  ylab("Density")


# Average temperature and precipitation vs. Presence
ggplot(data, aes(x = wc2.1_10m_tavg_01, y = wc2.1_10m_prec_01, color = factor(Presence))) +
  geom_point() +
  labs(title = "Average Temperature vs. Precipitation (January)",
       x = "Average Temperature (January)", y = "Precipitation (January)", color = "Presence")

