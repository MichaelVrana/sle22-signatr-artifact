library(ggplot2)


### Name: geom_violin
### Title: Violin plot
### Aliases: geom_violin stat_ydensity

### ** Examples

p <- ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_violin()

# Orientation follows the discrete axis
ggplot(mtcars, aes(mpg, factor(cyl))) +
  geom_violin()

## No test: 
##D p + geom_violin() + geom_jitter(height = 0, width = 0.1)
##D 
##D # Scale maximum width proportional to sample size:
##D p + geom_violin(scale = "count")
##D 
##D # Scale maximum width to 1 for all violins:
##D p + geom_violin(scale = "width")
##D 
##D # Default is to trim violins to the range of the data. To disable:
##D p + geom_violin(trim = FALSE)
##D 
##D # Use a smaller bandwidth for closer density fit (default is 1).
##D p + geom_violin(adjust = .5)
##D 
##D # Add aesthetic mappings
##D # Note that violins are automatically dodged when any aesthetic is
##D # a factor
##D p + geom_violin(aes(fill = cyl))
##D p + geom_violin(aes(fill = factor(cyl)))
##D p + geom_violin(aes(fill = factor(vs)))
##D p + geom_violin(aes(fill = factor(am)))
##D 
##D # Set aesthetics to fixed value
##D p + geom_violin(fill = "grey80", colour = "#3366FF")
##D 
##D # Show quartiles
##D p + geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))
##D 
##D # Scales vs. coordinate transforms -------
##D if (require("ggplot2movies")) {
##D # Scale transformations occur before the density statistics are computed.
##D # Coordinate transformations occur afterwards.  Observe the effect on the
##D # number of outliers.
##D m <- ggplot(movies, aes(y = votes, x = rating, group = cut_width(rating, 0.5)))
##D m + geom_violin()
##D m +
##D   geom_violin() +
##D   scale_y_log10()
##D m +
##D   geom_violin() +
##D   coord_trans(y = "log10")
##D m +
##D   geom_violin() +
##D   scale_y_log10() + coord_trans(y = "log10")
##D 
##D # Violin plots with continuous x:
##D # Use the group aesthetic to group observations in violins
##D ggplot(movies, aes(year, budget)) +
##D   geom_violin()
##D ggplot(movies, aes(year, budget)) +
##D   geom_violin(aes(group = cut_width(year, 10)), scale = "width")
##D }
## End(No test)



