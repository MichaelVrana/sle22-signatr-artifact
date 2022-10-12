library(ggplot2)


### Name: translate_qplot_lattice
### Title: Translating between qplot and lattice
### Aliases: translate_qplot_lattice
### Keywords: internal

### ** Examples

## No test: 
##D library(lattice)
##D 
##D if (require("ggplot2movies")) {
##D xyplot(rating ~ year, data=movies)
##D qplot(year, rating, data=movies)
##D 
##D xyplot(rating ~ year | Comedy + Action, data = movies)
##D qplot(year, rating, data = movies, facets = ~ Comedy + Action)
##D # Or maybe
##D qplot(year, rating, data = movies, facets = Comedy ~ Action)
##D 
##D # While lattice has many different functions to produce different types of
##D # graphics (which are all basically equivalent to setting the panel argument),
##D # ggplot2 has qplot().
##D 
##D stripplot(~ rating, data = movies, jitter.data = TRUE)
##D qplot(rating, 1, data = movies, geom = "jitter")
##D 
##D histogram(~ rating, data = movies)
##D qplot(rating, data = movies, geom = "histogram")
##D 
##D bwplot(Comedy ~ rating ,data = movies)
##D qplot(factor(Comedy), rating, data = movies, geom = "boxplot")
##D 
##D xyplot(wt ~ mpg, mtcars, type = c("p","smooth"))
##D qplot(mpg, wt, data = mtcars, geom = c("point","smooth"))
##D }
##D 
##D # The capabilities for scale manipulations are similar in both ggplot2 and
##D # lattice, although the syntax is a little different.
##D 
##D xyplot(wt ~ mpg | cyl, mtcars, scales = list(y = list(relation = "free")))
##D qplot(mpg, wt, data = mtcars) + facet_wrap(~ cyl, scales = "free")
##D 
##D xyplot(wt ~ mpg | cyl, mtcars, scales = list(log = 10))
##D qplot(mpg, wt, data = mtcars, log = "xy")
##D 
##D xyplot(wt ~ mpg | cyl, mtcars, scales = list(log = 2))
##D qplot(mpg, wt, data = mtcars) +
##D   scale_x_continuous(trans = scales::log2_trans()) +
##D   scale_y_continuous(trans = scales::log2_trans())
##D 
##D xyplot(wt ~ mpg, mtcars, group = cyl, auto.key = TRUE)
##D # Map directly to an aesthetic like colour, size, or shape.
##D qplot(mpg, wt, data = mtcars, colour = cyl)
##D 
##D xyplot(wt ~ mpg, mtcars, xlim = c(20,30))
##D # Works like lattice, except you can't specify a different limit
##D # for each panel/facet
##D qplot(mpg, wt, data = mtcars, xlim = c(20,30))
##D 
##D # Both lattice and ggplot2 have similar options for controlling labels on the plot.
##D 
##D xyplot(
##D   wt ~ mpg,
##D   mtcars,
##D   xlab = "Miles per gallon",
##D   ylab = "Weight",
##D   main = "Weight-efficiency tradeoff"
##D )
##D qplot(
##D   mpg,
##D   wt,
##D   data = mtcars,
##D   xlab = "Miles per gallon",
##D   ylab = "Weight",
##D   main = "Weight-efficiency tradeoff"
##D )
##D 
##D xyplot(wt ~ mpg, mtcars, aspect = 1)
##D qplot(mpg, wt, data = mtcars, asp = 1)
##D 
##D # par.settings() is equivalent to + theme() and trellis.options.set()
##D # and trellis.par.get() to theme_set() and theme_get().
##D # More complicated lattice formulas are equivalent to rearranging the data
##D # before using ggplot2.
## End(No test)



