library(ggplot2)


### Name: borders
### Title: Create a layer of map borders
### Aliases: borders

### ** Examples

if (require("maps")) {

ia <- map_data("county", "iowa")
mid_range <- function(x) mean(range(x))
seats <- do.call(rbind, lapply(split(ia, ia$subregion), function(d) {
  data.frame(lat = mid_range(d$lat), long = mid_range(d$long), subregion = unique(d$subregion))
}))

ggplot(ia, aes(long, lat)) +
  geom_polygon(aes(group = group), fill = NA, colour = "grey60") +
  geom_text(aes(label = subregion), data = seats, size = 2, angle = 45)
}

if (require("maps")) {
data(us.cities)
capitals <- subset(us.cities, capital == 2)
ggplot(capitals, aes(long, lat)) +
  borders("state") +
  geom_point(aes(size = pop)) +
  scale_size_area() +
  coord_quickmap()
}

if (require("maps")) {
# Same map, with some world context
ggplot(capitals, aes(long, lat)) +
  borders("world", xlim = c(-130, -60), ylim = c(20, 50)) +
  geom_point(aes(size = pop)) +
  scale_size_area() +
  coord_quickmap()
}



