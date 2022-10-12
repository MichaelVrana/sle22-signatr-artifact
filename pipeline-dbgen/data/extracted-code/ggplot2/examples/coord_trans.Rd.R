library(ggplot2)


### Name: coord_trans
### Title: Transformed Cartesian coordinate system
### Aliases: coord_trans

### ** Examples

## No test: 
##D # See ?geom_boxplot for other examples
##D 
##D # Three ways of doing transformation in ggplot:
##D #  * by transforming the data
##D ggplot(diamonds, aes(log10(carat), log10(price))) +
##D   geom_point()
##D #  * by transforming the scales
##D ggplot(diamonds, aes(carat, price)) +
##D   geom_point() +
##D   scale_x_log10() +
##D   scale_y_log10()
##D #  * by transforming the coordinate system:
##D ggplot(diamonds, aes(carat, price)) +
##D   geom_point() +
##D   coord_trans(x = "log10", y = "log10")
##D 
##D # The difference between transforming the scales and
##D # transforming the coordinate system is that scale
##D # transformation occurs BEFORE statistics, and coordinate
##D # transformation afterwards.  Coordinate transformation also
##D # changes the shape of geoms:
##D 
##D d <- subset(diamonds, carat > 0.5)
##D 
##D ggplot(d, aes(carat, price)) +
##D   geom_point() +
##D   geom_smooth(method = "lm") +
##D   scale_x_log10() +
##D   scale_y_log10()
##D 
##D ggplot(d, aes(carat, price)) +
##D   geom_point() +
##D   geom_smooth(method = "lm") +
##D   coord_trans(x = "log10", y = "log10")
##D 
##D # Here I used a subset of diamonds so that the smoothed line didn't
##D # drop below zero, which obviously causes problems on the log-transformed
##D # scale
##D 
##D # With a combination of scale and coordinate transformation, it's
##D # possible to do back-transformations:
##D ggplot(diamonds, aes(carat, price)) +
##D   geom_point() +
##D   geom_smooth(method = "lm") +
##D   scale_x_log10() +
##D   scale_y_log10() +
##D   coord_trans(x = scales::exp_trans(10), y = scales::exp_trans(10))
##D 
##D # cf.
##D ggplot(diamonds, aes(carat, price)) +
##D   geom_point() +
##D   geom_smooth(method = "lm")
##D 
##D # Also works with discrete scales
##D df <- data.frame(a = abs(rnorm(26)),letters)
##D plot <- ggplot(df,aes(a,letters)) + geom_point()
##D 
##D plot + coord_trans(x = "log10")
##D plot + coord_trans(x = "sqrt")
## End(No test)



