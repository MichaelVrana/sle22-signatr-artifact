library(ggplot2)


### Name: stat_summary_bin
### Title: Summarise y values at unique/binned x
### Aliases: stat_summary_bin stat_summary

### ** Examples

d <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
d + stat_summary(fun.data = "mean_cl_boot", colour = "red", size = 2)

# Orientation follows the discrete axis
ggplot(mtcars, aes(mpg, factor(cyl))) +
  geom_point() +
  stat_summary(fun.data = "mean_cl_boot", colour = "red", size = 2)

# You can supply individual functions to summarise the value at
# each x:
d + stat_summary(fun = "median", colour = "red", size = 2, geom = "point")
d + stat_summary(fun = "mean", colour = "red", size = 2, geom = "point")
d + aes(colour = factor(vs)) + stat_summary(fun = mean, geom="line")

d + stat_summary(fun = mean, fun.min = min, fun.max = max, colour = "red")

d <- ggplot(diamonds, aes(cut))
d + geom_bar()
d + stat_summary(aes(y = price), fun = "mean", geom = "bar")

# Orientation of stat_summary_bin is ambiguous and must be specified directly
ggplot(diamonds, aes(carat, price)) +
  stat_summary_bin(fun = "mean", geom = "bar", orientation = 'y')

## No test: 
##D # Don't use ylim to zoom into a summary plot - this throws the
##D # data away
##D p <- ggplot(mtcars, aes(cyl, mpg)) +
##D   stat_summary(fun = "mean", geom = "point")
##D p
##D p + ylim(15, 30)
##D # Instead use coord_cartesian
##D p + coord_cartesian(ylim = c(15, 30))
##D 
##D # A set of useful summary functions is provided from the Hmisc package:
##D stat_sum_df <- function(fun, geom="crossbar", ...) {
##D   stat_summary(fun.data = fun, colour = "red", geom = geom, width = 0.2, ...)
##D }
##D d <- ggplot(mtcars, aes(cyl, mpg)) + geom_point()
##D # The crossbar geom needs grouping to be specified when used with
##D # a continuous x axis.
##D d + stat_sum_df("mean_cl_boot", mapping = aes(group = cyl))
##D d + stat_sum_df("mean_sdl", mapping = aes(group = cyl))
##D d + stat_sum_df("mean_sdl", fun.args = list(mult = 1), mapping = aes(group = cyl))
##D d + stat_sum_df("median_hilow", mapping = aes(group = cyl))
##D 
##D # An example with highly skewed distributions:
##D if (require("ggplot2movies")) {
##D set.seed(596)
##D mov <- movies[sample(nrow(movies), 1000), ]
##D  m2 <-
##D    ggplot(mov, aes(x = factor(round(rating)), y = votes)) +
##D    geom_point()
##D  m2 <-
##D    m2 +
##D    stat_summary(
##D      fun.data = "mean_cl_boot",
##D      geom = "crossbar",
##D      colour = "red", width = 0.3
##D    ) +
##D    xlab("rating")
##D m2
##D # Notice how the overplotting skews off visual perception of the mean
##D # supplementing the raw data with summary statistics is _very_ important
##D 
##D # Next, we'll look at votes on a log scale.
##D 
##D # Transforming the scale means the data are transformed
##D # first, after which statistics are computed:
##D m2 + scale_y_log10()
##D # Transforming the coordinate system occurs after the
##D # statistic has been computed. This means we're calculating the summary on the raw data
##D # and stretching the geoms onto the log scale.  Compare the widths of the
##D # standard errors.
##D m2 + coord_trans(y="log10")
##D }
## End(No test)



