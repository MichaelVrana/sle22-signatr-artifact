library(ggplot2)


### Name: aes_group_order
### Title: Aesthetics: grouping
### Aliases: aes_group_order group

### ** Examples

## No test: 
##D 
##D p <- ggplot(mtcars, aes(wt, mpg))
##D # A basic scatter plot
##D p + geom_point(size = 4)
##D # Using the colour aesthetic
##D p + geom_point(aes(colour = factor(cyl)), size = 4)
##D # Using the shape aesthetic
##D p + geom_point(aes(shape = factor(cyl)), size = 4)
##D 
##D # Using fill
##D p <- ggplot(mtcars, aes(factor(cyl)))
##D p + geom_bar()
##D p + geom_bar(aes(fill = factor(cyl)))
##D p + geom_bar(aes(fill = factor(vs)))
##D 
##D # Using linetypes
##D ggplot(economics_long, aes(date, value01)) +
##D   geom_line(aes(linetype = variable))
##D 
##D # Multiple groups with one aesthetic
##D p <- ggplot(nlme::Oxboys, aes(age, height))
##D # The default is not sufficient here. A single line tries to connect all
##D # the observations.
##D p + geom_line()
##D # To fix this, use the group aesthetic to map a different line for each
##D # subject.
##D p + geom_line(aes(group = Subject))
##D 
##D # Different groups on different layers
##D p <- p + geom_line(aes(group = Subject))
##D # Using the group aesthetic with both geom_line() and geom_smooth()
##D # groups the data the same way for both layers
##D p + geom_smooth(aes(group = Subject), method = "lm", se = FALSE)
##D # Changing the group aesthetic for the smoother layer
##D # fits a single line of best fit across all boys
##D p + geom_smooth(aes(group = 1), size = 2, method = "lm", se = FALSE)
##D 
##D # Overriding the default grouping
##D # Sometimes the plot has a discrete scale but you want to draw lines
##D # that connect across groups. This is the strategy used in interaction
##D # plots, profile plots, and parallel coordinate plots, among others.
##D # For example, we draw boxplots of height at each measurement occasion.
##D p <- ggplot(nlme::Oxboys, aes(Occasion, height)) + geom_boxplot()
##D p
##D # There is no need to specify the group aesthetic here; the default grouping
##D # works because occasion is a discrete variable. To overlay individual
##D # trajectories, we again need to override the default grouping for that layer
##D # with aes(group = Subject)
##D p + geom_line(aes(group = Subject), colour = "blue")
## End(No test)



