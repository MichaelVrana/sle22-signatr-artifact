library(ggplot2)


### Name: scale_x_discrete
### Title: Position scales for discrete data
### Aliases: scale_x_discrete scale_y_discrete

### ** Examples

ggplot(diamonds, aes(cut)) + geom_bar()

## No test: 
##D # The discrete position scale is added automatically whenever you
##D # have a discrete position.
##D 
##D (d <- ggplot(subset(diamonds, carat > 1), aes(cut, clarity)) +
##D       geom_jitter())
##D 
##D d + scale_x_discrete("Cut")
##D d +
##D   scale_x_discrete(
##D     "Cut",
##D     labels = c(
##D       "Fair" = "F",
##D       "Good" = "G",
##D       "Very Good" = "VG",
##D       "Perfect" = "P",
##D       "Ideal" = "I"
##D     )
##D   )
##D 
##D # Use limits to adjust the which levels (and in what order)
##D # are displayed
##D d + scale_x_discrete(limits = c("Fair","Ideal"))
##D 
##D # you can also use the short hand functions xlim and ylim
##D d + xlim("Fair","Ideal", "Good")
##D d + ylim("I1", "IF")
##D 
##D # See ?reorder to reorder based on the values of another variable
##D ggplot(mpg, aes(manufacturer, cty)) +
##D   geom_point()
##D ggplot(mpg, aes(reorder(manufacturer, cty), cty)) +
##D   geom_point()
##D ggplot(mpg, aes(reorder(manufacturer, displ), cty)) +
##D   geom_point()
##D 
##D # Use abbreviate as a formatter to reduce long names
##D ggplot(mpg, aes(reorder(manufacturer, displ), cty)) +
##D   geom_point() +
##D   scale_x_discrete(labels = abbreviate)
## End(No test)



