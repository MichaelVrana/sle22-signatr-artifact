library(ggplot2)


### Name: aes_colour_fill_alpha
### Title: Colour related aesthetics: colour, fill, and alpha
### Aliases: aes_colour_fill_alpha colour color fill

### ** Examples

## No test: 
##D 
##D # Bar chart example
##D p <- ggplot(mtcars, aes(factor(cyl)))
##D # Default plotting
##D p + geom_bar()
##D # To change the interior colouring use fill aesthetic
##D p + geom_bar(fill = "red")
##D # Compare with the colour aesthetic which changes just the bar outline
##D p + geom_bar(colour = "red")
##D # Combining both, you can see the changes more clearly
##D p + geom_bar(fill = "white", colour = "red")
##D # Both colour and fill can take an rgb specification.
##D p + geom_bar(fill = "#00abff")
##D # Use NA for a completely transparent colour.
##D p + geom_bar(fill = NA, colour = "#00abff")
##D 
##D # Colouring scales differ depending on whether a discrete or
##D # continuous variable is being mapped. For example, when mapping
##D # fill to a factor variable, a discrete colour scale is used.
##D ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) + geom_bar()
##D 
##D # When mapping fill to continuous variable a continuous colour
##D # scale is used.
##D ggplot(faithfuld, aes(waiting, eruptions)) +
##D   geom_raster(aes(fill = density))
##D 
##D # Some geoms only use the colour aesthetic but not the fill
##D # aesthetic (e.g. geom_point() or geom_line()).
##D p <- ggplot(economics, aes(x = date, y = unemploy))
##D p + geom_line()
##D p + geom_line(colour = "green")
##D p + geom_point()
##D p + geom_point(colour = "red")
##D 
##D # For large datasets with overplotting the alpha
##D # aesthetic will make the points more transparent.
##D df <- data.frame(x = rnorm(5000), y = rnorm(5000))
##D p  <- ggplot(df, aes(x,y))
##D p + geom_point()
##D p + geom_point(alpha = 0.5)
##D p + geom_point(alpha = 1/10)
##D 
##D # Alpha can also be used to add shading.
##D p <- ggplot(economics, aes(x = date, y = unemploy)) + geom_line()
##D p
##D yrng <- range(economics$unemploy)
##D p <- p +
##D   geom_rect(
##D     aes(NULL, NULL, xmin = start, xmax = end, fill = party),
##D     ymin = yrng[1], ymax = yrng[2], data = presidential
##D   )
##D p
##D p + scale_fill_manual(values = alpha(c("blue", "red"), .3))
## End(No test)



