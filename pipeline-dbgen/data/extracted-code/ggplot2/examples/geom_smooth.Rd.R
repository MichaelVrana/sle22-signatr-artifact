library(ggplot2)


### Name: geom_smooth
### Title: Smoothed conditional means
### Aliases: geom_smooth stat_smooth

### ** Examples

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()

# If you need the fitting to be done along the y-axis set the orientation
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(orientation = "y")

# Use span to control the "wiggliness" of the default loess smoother.
# The span is the fraction of points used to fit each local regression:
# small numbers make a wigglier curve, larger numbers make a smoother curve.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.3)

# Instead of a loess smooth, you can use any other modelling function:
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(method = lm, formula = y ~ splines::bs(x, 3), se = FALSE)

# Smooths are automatically fit to each group (defined by categorical
# aesthetics or the group aesthetic) and for each facet.

ggplot(mpg, aes(displ, hwy, colour = class)) +
  geom_point() +
  geom_smooth(se = FALSE, method = lm)
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(span = 0.8) +
  facet_wrap(~drv)

## No test: 
##D binomial_smooth <- function(...) {
##D   geom_smooth(method = "glm", method.args = list(family = "binomial"), ...)
##D }
##D # To fit a logistic regression, you need to coerce the values to
##D # a numeric vector lying between 0 and 1.
##D ggplot(rpart::kyphosis, aes(Age, Kyphosis)) +
##D   geom_jitter(height = 0.05) +
##D   binomial_smooth()
##D 
##D ggplot(rpart::kyphosis, aes(Age, as.numeric(Kyphosis) - 1)) +
##D   geom_jitter(height = 0.05) +
##D   binomial_smooth()
##D 
##D ggplot(rpart::kyphosis, aes(Age, as.numeric(Kyphosis) - 1)) +
##D   geom_jitter(height = 0.05) +
##D   binomial_smooth(formula = y ~ splines::ns(x, 2))
##D 
##D # But in this case, it's probably better to fit the model yourself
##D # so you can exercise more control and see whether or not it's a good model.
## End(No test)



