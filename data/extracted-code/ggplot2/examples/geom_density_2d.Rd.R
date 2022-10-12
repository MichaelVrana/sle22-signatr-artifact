library(ggplot2)


### Name: geom_density_2d
### Title: Contours of a 2D density estimate
### Aliases: geom_density_2d geom_density2d geom_density_2d_filled
###   geom_density2d_filled stat_density_2d stat_density2d
###   stat_density_2d_filled stat_density2d_filled

### ** Examples

m <- ggplot(faithful, aes(x = eruptions, y = waiting)) +
 geom_point() +
 xlim(0.5, 6) +
 ylim(40, 110)

# contour lines
m + geom_density_2d()

## No test: 
##D # contour bands
##D m + geom_density_2d_filled(alpha = 0.5)
##D 
##D # contour bands and contour lines
##D m + geom_density_2d_filled(alpha = 0.5) +
##D   geom_density_2d(size = 0.25, colour = "black")
##D 
##D set.seed(4393)
##D dsmall <- diamonds[sample(nrow(diamonds), 1000), ]
##D d <- ggplot(dsmall, aes(x, y))
##D # If you map an aesthetic to a categorical variable, you will get a
##D # set of contours for each value of that variable
##D d + geom_density_2d(aes(colour = cut))
##D 
##D # If you draw filled contours across multiple facets, the same bins are
##D # used across all facets
##D d + geom_density_2d_filled() + facet_wrap(vars(cut))
##D # If you want to make sure the peak intensity is the same in each facet,
##D # use `contour_var = "ndensity"`.
##D d + geom_density_2d_filled(contour_var = "ndensity") + facet_wrap(vars(cut))
##D # If you want to scale intensity by the number of observations in each group,
##D # use `contour_var = "count"`.
##D d + geom_density_2d_filled(contour_var = "count") + facet_wrap(vars(cut))
##D 
##D # If we turn contouring off, we can use other geoms, such as tiles:
##D d + stat_density_2d(
##D   geom = "raster",
##D   aes(fill = after_stat(density)),
##D   contour = FALSE
##D ) + scale_fill_viridis_c()
##D # Or points:
##D d + stat_density_2d(geom = "point", aes(size = after_stat(density)), n = 20, contour = FALSE)
## End(No test)



