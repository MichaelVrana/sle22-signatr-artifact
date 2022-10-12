library(ggplot2)


### Name: geom_boxplot
### Title: A box and whiskers plot (in the style of Tukey)
### Aliases: geom_boxplot stat_boxplot

### ** Examples

p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()
# Orientation follows the discrete axis
ggplot(mpg, aes(hwy, class)) + geom_boxplot()

p + geom_boxplot(notch = TRUE)
p + geom_boxplot(varwidth = TRUE)
p + geom_boxplot(fill = "white", colour = "#3366FF")
# By default, outlier points match the colour of the box. Use
# outlier.colour to override
p + geom_boxplot(outlier.colour = "red", outlier.shape = 1)
# Remove outliers when overlaying boxplot with original data points
p + geom_boxplot(outlier.shape = NA) + geom_jitter(width = 0.2)

# Boxplots are automatically dodged when any aesthetic is a factor
p + geom_boxplot(aes(colour = drv))

# You can also use boxplots with continuous x, as long as you supply
# a grouping variable. cut_width is particularly useful
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot()
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.25)))
# Adjust the transparency of outliers using outlier.alpha
ggplot(diamonds, aes(carat, price)) +
  geom_boxplot(aes(group = cut_width(carat, 0.25)), outlier.alpha = 0.1)

## No test: 
##D # It's possible to draw a boxplot with your own computations if you
##D # use stat = "identity":
##D y <- rnorm(100)
##D df <- data.frame(
##D   x = 1,
##D   y0 = min(y),
##D   y25 = quantile(y, 0.25),
##D   y50 = median(y),
##D   y75 = quantile(y, 0.75),
##D   y100 = max(y)
##D )
##D ggplot(df, aes(x)) +
##D   geom_boxplot(
##D    aes(ymin = y0, lower = y25, middle = y50, upper = y75, ymax = y100),
##D    stat = "identity"
##D  )
## End(No test)



