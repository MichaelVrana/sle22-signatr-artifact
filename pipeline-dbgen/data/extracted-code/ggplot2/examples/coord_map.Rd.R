library(ggplot2)


### Name: coord_map
### Title: Map projections
### Aliases: coord_map coord_quickmap

### ** Examples

if (require("maps")) {
nz <- map_data("nz")
# Prepare a map of NZ
nzmap <- ggplot(nz, aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

# Plot it in cartesian coordinates
nzmap
}

if (require("maps")) {
# With correct mercator projection
nzmap + coord_map()
}

if (require("maps")) {
# With the aspect ratio approximation
nzmap + coord_quickmap()
}

if (require("maps")) {
# Other projections
nzmap + coord_map("azequalarea", orientation = c(-36.92, 174.6, 0))
}

if (require("maps")) {
states <- map_data("state")
usamap <- ggplot(states, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black")

# Use cartesian coordinates
usamap
}

if (require("maps")) {
# With mercator projection
usamap + coord_map()
}

if (require("maps")) {
# See ?mapproject for coordinate systems and their parameters
usamap + coord_map("gilbert")
}

if (require("maps")) {
# For most projections, you'll need to set the orientation yourself
# as the automatic selection done by mapproject is not available to
# ggplot
usamap + coord_map("orthographic")
}

if (require("maps")) {
usamap + coord_map("conic", lat0 = 30)
}

if (require("maps")) {
usamap + coord_map("bonne", lat0 = 50)
}

## Not run: 
##D if (require("maps")) {
##D # World map, using geom_path instead of geom_polygon
##D world <- map_data("world")
##D worldmap <- ggplot(world, aes(x = long, y = lat, group = group)) +
##D   geom_path() +
##D   scale_y_continuous(breaks = (-2:2) * 30) +
##D   scale_x_continuous(breaks = (-4:4) * 45)
##D 
##D # Orthographic projection with default orientation (looking down at North pole)
##D worldmap + coord_map("ortho")
##D }
##D 
##D if (require("maps")) {
##D # Looking up up at South Pole
##D worldmap + coord_map("ortho", orientation = c(-90, 0, 0))
##D }
##D 
##D if (require("maps")) {
##D # Centered on New York (currently has issues with closing polygons)
##D worldmap + coord_map("ortho", orientation = c(41, -74, 0))
##D }
## End(Not run)



