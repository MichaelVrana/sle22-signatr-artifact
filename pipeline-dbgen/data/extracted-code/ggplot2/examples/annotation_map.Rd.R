library(ggplot2)


### Name: annotation_map
### Title: Annotation: a map
### Aliases: annotation_map

### ** Examples

## Not run: 
##D if (requireNamespace("maps", quietly = TRUE)) {
##D # location of cities in North Carolina
##D df <- data.frame(
##D   name = c("Charlotte", "Raleigh", "Greensboro"),
##D   lat = c(35.227, 35.772, 36.073),
##D   long = c(-80.843, -78.639, -79.792)
##D )
##D 
##D p <- ggplot(df, aes(x = long, y = lat)) +
##D   annotation_map(
##D     map_data("state"),
##D     fill = "antiquewhite", colour = "darkgrey"
##D   ) +
##D   geom_point(color = "blue") +
##D   geom_text(
##D     aes(label = name),
##D     hjust = 1.105, vjust = 1.05, color = "blue"
##D   )
##D 
##D # use without coord_sf() is possible but not recommended
##D p + xlim(-84, -76) + ylim(34, 37.2)
##D 
##D if (requireNamespace("sf", quietly = TRUE)) {
##D # use with coord_sf() for appropriate projection
##D p +
##D   coord_sf(
##D     crs = st_crs(3347),
##D     default_crs = st_crs(4326),  # data is provided as long-lat
##D     xlim = c(-84, -76),
##D     ylim = c(34, 37.2)
##D   )
##D 
##D # you can mix annotation_map() and geom_sf()
##D nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"), quiet = TRUE)
##D p +
##D   geom_sf(
##D     data = nc, inherit.aes = FALSE,
##D     fill = NA, color = "black", size = 0.1
##D   ) +
##D   coord_sf(crs = st_crs(3347), default_crs = st_crs(4326))
##D }}
## End(Not run)



