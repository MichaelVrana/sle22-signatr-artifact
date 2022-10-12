library(ggplot2)


### Name: facet_wrap
### Title: Wrap a 1d ribbon of panels into 2d
### Aliases: facet_wrap

### ** Examples

p <- ggplot(mpg, aes(displ, hwy)) + geom_point()

# Use vars() to supply faceting variables:
p + facet_wrap(vars(class))

# Control the number of rows and columns with nrow and ncol
p + facet_wrap(vars(class), nrow = 4)

## No test: 
##D # You can facet by multiple variables
##D ggplot(mpg, aes(displ, hwy)) +
##D   geom_point() +
##D   facet_wrap(vars(cyl, drv))
##D 
##D # Use the `labeller` option to control how labels are printed:
##D ggplot(mpg, aes(displ, hwy)) +
##D   geom_point() +
##D   facet_wrap(vars(cyl, drv), labeller = "label_both")
##D 
##D # To change the order in which the panels appear, change the levels
##D # of the underlying factor.
##D mpg$class2 <- reorder(mpg$class, mpg$displ)
##D ggplot(mpg, aes(displ, hwy)) +
##D   geom_point() +
##D   facet_wrap(vars(class2))
##D 
##D # By default, the same scales are used for all panels. You can allow
##D # scales to vary across the panels with the `scales` argument.
##D # Free scales make it easier to see patterns within each panel, but
##D # harder to compare across panels.
##D ggplot(mpg, aes(displ, hwy)) +
##D   geom_point() +
##D   facet_wrap(vars(class), scales = "free")
##D 
##D # To repeat the same data in every panel, simply construct a data frame
##D # that does not contain the faceting variable.
##D ggplot(mpg, aes(displ, hwy)) +
##D   geom_point(data = transform(mpg, class = NULL), colour = "grey85") +
##D   geom_point() +
##D   facet_wrap(vars(class))
##D 
##D # Use `strip.position` to display the facet labels at the side of your
##D # choice. Setting it to `bottom` makes it act as a subtitle for the axis.
##D # This is typically used with free scales and a theme without boxes around
##D # strip labels.
##D ggplot(economics_long, aes(date, value)) +
##D   geom_line() +
##D   facet_wrap(vars(variable), scales = "free_y", nrow = 2, strip.position = "top") +
##D   theme(strip.background = element_blank(), strip.placement = "outside")
## End(No test)



