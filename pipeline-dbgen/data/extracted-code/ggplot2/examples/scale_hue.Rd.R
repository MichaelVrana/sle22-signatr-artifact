library(ggplot2)


### Name: scale_colour_hue
### Title: Evenly spaced colours for discrete data
### Aliases: scale_colour_hue scale_fill_hue scale_color_hue

### ** Examples

## No test: 
##D dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
##D (d <- ggplot(dsamp, aes(carat, price)) + geom_point(aes(colour = clarity)))
##D 
##D # Change scale label
##D d + scale_colour_hue()
##D d + scale_colour_hue("clarity")
##D d + scale_colour_hue(expression(clarity[beta]))
##D 
##D # Adjust luminosity and chroma
##D d + scale_colour_hue(l = 40, c = 30)
##D d + scale_colour_hue(l = 70, c = 30)
##D d + scale_colour_hue(l = 70, c = 150)
##D d + scale_colour_hue(l = 80, c = 150)
##D 
##D # Change range of hues used
##D d + scale_colour_hue(h = c(0, 90))
##D d + scale_colour_hue(h = c(90, 180))
##D d + scale_colour_hue(h = c(180, 270))
##D d + scale_colour_hue(h = c(270, 360))
##D 
##D # Vary opacity
##D # (only works with pdf, quartz and cairo devices)
##D d <- ggplot(dsamp, aes(carat, price, colour = clarity))
##D d + geom_point(alpha = 0.9)
##D d + geom_point(alpha = 0.5)
##D d + geom_point(alpha = 0.2)
##D 
##D # Colour of missing values is controlled with na.value:
##D miss <- factor(sample(c(NA, 1:5), nrow(mtcars), replace = TRUE))
##D ggplot(mtcars, aes(mpg, wt)) +
##D   geom_point(aes(colour = miss))
##D ggplot(mtcars, aes(mpg, wt)) +
##D   geom_point(aes(colour = miss)) +
##D   scale_colour_hue(na.value = "black")
## End(No test)



