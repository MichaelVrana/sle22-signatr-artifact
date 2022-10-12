library(ggplot2)


### Name: geom_contour
### Title: 2D contours of a 3D surface
### Aliases: geom_contour geom_contour_filled stat_contour
###   stat_contour_filled

### ** Examples

# Basic plot
v <- ggplot(faithfuld, aes(waiting, eruptions, z = density))
v + geom_contour()

# Or compute from raw data
ggplot(faithful, aes(waiting, eruptions)) +
  geom_density_2d()

## No test: 
##D # use geom_contour_filled() for filled contours
##D v + geom_contour_filled()
##D 
##D # Setting bins creates evenly spaced contours in the range of the data
##D v + geom_contour(bins = 3)
##D v + geom_contour(bins = 5)
##D 
##D # Setting binwidth does the same thing, parameterised by the distance
##D # between contours
##D v + geom_contour(binwidth = 0.01)
##D v + geom_contour(binwidth = 0.001)
##D 
##D # Other parameters
##D v + geom_contour(aes(colour = after_stat(level)))
##D v + geom_contour(colour = "red")
##D v + geom_raster(aes(fill = density)) +
##D   geom_contour(colour = "white")
##D 
##D # Irregular data
##D if (requireNamespace("interp")) {
##D   # Use a dataset from the interp package
##D   data(franke, package = "interp")
##D   origdata <- as.data.frame(interp::franke.data(1, 1, franke))
##D   grid <- with(origdata, interp::interp(x, y, z))
##D   griddf <- subset(data.frame(x = rep(grid$x, nrow(grid$z)),
##D                               y = rep(grid$y, each = ncol(grid$z)),
##D                               z = as.numeric(grid$z)),
##D                    !is.na(z))
##D   ggplot(griddf, aes(x, y, z = z)) +
##D     geom_contour_filled() +
##D     geom_point(data = origdata)
##D } else
##D   message("Irregular data requires the 'interp' package")
## End(No test)



