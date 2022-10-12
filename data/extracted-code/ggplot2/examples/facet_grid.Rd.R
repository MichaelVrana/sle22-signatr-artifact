library(ggplot2)


### Name: facet_grid
### Title: Lay out panels in a grid
### Aliases: facet_grid

### ** Examples

p <- ggplot(mpg, aes(displ, cty)) + geom_point()

# Use vars() to supply variables from the dataset:
p + facet_grid(rows = vars(drv))
p + facet_grid(cols = vars(cyl))
p + facet_grid(vars(drv), vars(cyl))

# To change plot order of facet grid,
# change the order of variable levels with factor()

# If you combine a facetted dataset with a dataset that lacks those
# faceting variables, the data will be repeated across the missing
# combinations:
df <- data.frame(displ = mean(mpg$displ), cty = mean(mpg$cty))
p +
  facet_grid(cols = vars(cyl)) +
  geom_point(data = df, colour = "red", size = 2)

# Free scales -------------------------------------------------------
# You can also choose whether the scales should be constant
# across all panels (the default), or whether they should be allowed
# to vary
mt <- ggplot(mtcars, aes(mpg, wt, colour = factor(cyl))) +
  geom_point()

mt + facet_grid(vars(cyl), scales = "free")

# If scales and space are free, then the mapping between position
# and values in the data will be the same across all panels. This
# is particularly useful for categorical axes
ggplot(mpg, aes(drv, model)) +
  geom_point() +
  facet_grid(manufacturer ~ ., scales = "free", space = "free") +
  theme(strip.text.y = element_text(angle = 0))

# Margins ----------------------------------------------------------
## No test: 
##D # Margins can be specified logically (all yes or all no) or for specific
##D # variables as (character) variable names
##D mg <- ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point()
##D mg + facet_grid(vs + am ~ gear, margins = TRUE)
##D mg + facet_grid(vs + am ~ gear, margins = "am")
##D # when margins are made over "vs", since the facets for "am" vary
##D # within the values of "vs", the marginal facet for "vs" is also
##D # a margin over "am".
##D mg + facet_grid(vs + am ~ gear, margins = "vs")
## End(No test)



