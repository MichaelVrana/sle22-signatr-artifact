library(ggplot2)


### Name: sf_transform_xy
### Title: Transform spatial position data
### Aliases: sf_transform_xy
### Keywords: internal

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
# location of cities in NC by long (x) and lat (y)
data <- data.frame(
  city = c("Charlotte", "Raleigh", "Greensboro"),
  x =  c(-80.843, -78.639, -79.792),
  y = c(35.227, 35.772, 36.073)
)

# transform to projected coordinates
data_proj <- sf_transform_xy(data, 3347, 4326)
data_proj

# transform back
sf_transform_xy(data_proj, 4326, 3347)
}



