# speeds plot
ggplotly(
  ggplot(data = data.formatted %>% filter(speed < 60),
         aes(x = line, y = speed, colour = line)) + geom_boxplot() + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
)

# plotting all buses of chosen line on map

line.chosen <- 180

data.leaflet <- data.formatted %>% filter(line == line.chosen)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng = data.leaflet$lon, lat = data.leaflet$lat)
m  # Print the map
