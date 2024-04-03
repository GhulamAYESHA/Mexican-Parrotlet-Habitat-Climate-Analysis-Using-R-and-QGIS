
library(leaflet)
library(dplyr)

# Read the dataset from CSV file
data <- read.csv("data.csv")

# Create a leaflet map
map <- leaflet(data) %>%
  addTiles() %>%
  setView(lng = -102, lat = 23, zoom = 5)  # Set initial map view

# Add points for presence and absence
map <- map %>%
  addCircleMarkers(
    lng = ~Long, lat = ~Lat,
    color = ~ifelse(Presence == 1, "green", "red"),
    radius = 2, fillOpacity = 0.8,
    popup = ~paste("Presence:", Presence)
  )

# Display the map
map

