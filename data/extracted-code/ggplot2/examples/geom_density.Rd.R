library(ggplot2)


### Name: geom_density
### Title: Smoothed density estimates
### Aliases: geom_density stat_density

### ** Examples

ggplot(diamonds, aes(carat)) +
  geom_density()
# Map the values to y to flip the orientation
ggplot(diamonds, aes(y = carat)) +
  geom_density()

ggplot(diamonds, aes(carat)) +
  geom_density(adjust = 1/5)
ggplot(diamonds, aes(carat)) +
  geom_density(adjust = 5)

ggplot(diamonds, aes(depth, colour = cut)) +
  geom_density() +
  xlim(55, 70)
ggplot(diamonds, aes(depth, fill = cut, colour = cut)) +
  geom_density(alpha = 0.1) +
  xlim(55, 70)

## No test: 
##D # Stacked density plots: if you want to create a stacked density plot, you
##D # probably want to 'count' (density * n) variable instead of the default
##D # density
##D 
##D # Loses marginal densities
##D ggplot(diamonds, aes(carat, fill = cut)) +
##D   geom_density(position = "stack")
##D # Preserves marginal densities
##D ggplot(diamonds, aes(carat, after_stat(count), fill = cut)) +
##D   geom_density(position = "stack")
##D 
##D # You can use position="fill" to produce a conditional density estimate
##D ggplot(diamonds, aes(carat, after_stat(count), fill = cut)) +
##D   geom_density(position = "fill")
## End(No test)



