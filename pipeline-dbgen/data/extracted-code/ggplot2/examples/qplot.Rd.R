library(ggplot2)


### Name: qplot
### Title: Quick plot
### Aliases: qplot quickplot

### ** Examples

# Use data from data.frame
qplot(mpg, wt, data = mtcars)
qplot(mpg, wt, data = mtcars, colour = cyl)
qplot(mpg, wt, data = mtcars, size = cyl)
qplot(mpg, wt, data = mtcars, facets = vs ~ am)

## No test: 
##D qplot(1:10, rnorm(10), colour = runif(10))
##D qplot(1:10, letters[1:10])
##D mod <- lm(mpg ~ wt, data = mtcars)
##D qplot(resid(mod), fitted(mod))
##D 
##D f <- function() {
##D    a <- 1:10
##D    b <- a ^ 2
##D    qplot(a, b)
##D }
##D f()
##D 
##D # To set aesthetics, wrap in I()
##D qplot(mpg, wt, data = mtcars, colour = I("red"))
##D 
##D # qplot will attempt to guess what geom you want depending on the input
##D # both x and y supplied = scatterplot
##D qplot(mpg, wt, data = mtcars)
##D # just x supplied = histogram
##D qplot(mpg, data = mtcars)
##D # just y supplied = scatterplot, with x = seq_along(y)
##D qplot(y = mpg, data = mtcars)
##D 
##D # Use different geoms
##D qplot(mpg, wt, data = mtcars, geom = "path")
##D qplot(factor(cyl), wt, data = mtcars, geom = c("boxplot", "jitter"))
##D qplot(mpg, data = mtcars, geom = "dotplot")
## End(No test)



