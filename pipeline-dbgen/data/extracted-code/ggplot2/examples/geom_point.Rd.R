library(ggplot2)


### Name: geom_point
### Title: Points
### Aliases: geom_point

### ** Examples

p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point()

# Add aesthetic mappings
p + geom_point(aes(colour = factor(cyl)))
p + geom_point(aes(shape = factor(cyl)))
# A "bubblechart":
p + geom_point(aes(size = qsec))

# Set aesthetics to fixed value
ggplot(mtcars, aes(wt, mpg)) + geom_point(colour = "red", size = 3)

## No test: 
##D # Varying alpha is useful for large datasets
##D d <- ggplot(diamonds, aes(carat, price))
##D d + geom_point(alpha = 1/10)
##D d + geom_point(alpha = 1/20)
##D d + geom_point(alpha = 1/100)
## End(No test)

# For shapes that have a border (like 21), you can colour the inside and
# outside separately. Use the stroke aesthetic to modify the width of the
# border
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)

## No test: 
##D # You can create interesting shapes by layering multiple points of
##D # different sizes
##D p <- ggplot(mtcars, aes(mpg, wt, shape = factor(cyl)))
##D p +
##D   geom_point(aes(colour = factor(cyl)), size = 4) +
##D   geom_point(colour = "grey90", size = 1.5)
##D p +
##D   geom_point(colour = "black", size = 4.5) +
##D   geom_point(colour = "pink", size = 4) +
##D   geom_point(aes(shape = factor(cyl)))
##D 
##D # geom_point warns when missing values have been dropped from the data set
##D # and not plotted, you can turn this off by setting na.rm = TRUE
##D mtcars2 <- transform(mtcars, mpg = ifelse(runif(32) < 0.2, NA, mpg))
##D ggplot(mtcars2, aes(wt, mpg)) +
##D   geom_point()
##D ggplot(mtcars2, aes(wt, mpg)) +
##D   geom_point(na.rm = TRUE)
## End(No test)



