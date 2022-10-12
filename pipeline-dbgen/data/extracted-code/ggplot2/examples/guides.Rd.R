library(ggplot2)


### Name: guides
### Title: Set guides for each scale
### Aliases: guides

### ** Examples

## No test: 
##D # ggplot object
##D 
##D dat <- data.frame(x = 1:5, y = 1:5, p = 1:5, q = factor(1:5),
##D  r = factor(1:5))
##D p <-
##D   ggplot(dat, aes(x, y, colour = p, size = q, shape = r)) +
##D   geom_point()
##D 
##D # without guide specification
##D p
##D 
##D # Show colorbar guide for colour.
##D # All these examples below have a same effect.
##D 
##D p + guides(colour = "colorbar", size = "legend", shape = "legend")
##D p + guides(colour = guide_colorbar(), size = guide_legend(),
##D   shape = guide_legend())
##D p +
##D  scale_colour_continuous(guide = "colorbar") +
##D  scale_size_discrete(guide = "legend") +
##D  scale_shape(guide = "legend")
##D 
##D  # Remove some guides
##D  p + guides(colour = "none")
##D  p + guides(colour = "colorbar",size = "none")
##D 
##D # Guides are integrated where possible
##D 
##D p +
##D   guides(
##D     colour = guide_legend("title"),
##D     size = guide_legend("title"),
##D     shape = guide_legend("title")
##D  )
##D # same as
##D g <- guide_legend("title")
##D p + guides(colour = g, size = g, shape = g)
##D 
##D p + theme(legend.position = "bottom")
##D 
##D # position of guides
##D 
##D # Set order for multiple guides
##D ggplot(mpg, aes(displ, cty)) +
##D   geom_point(aes(size = hwy, colour = cyl, shape = drv)) +
##D   guides(
##D    colour = guide_colourbar(order = 1),
##D    shape = guide_legend(order = 2),
##D    size = guide_legend(order = 3)
##D  )
## End(No test)



