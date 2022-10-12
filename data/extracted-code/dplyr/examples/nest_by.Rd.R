library(dplyr)


### Name: nest_by
### Title: Nest by one or more variables
### Aliases: nest_by
### Keywords: internal

### ** Examples

# After nesting, you get one row per group
iris %>% nest_by(Species)
starwars %>% nest_by(species)

# The output is grouped by row, which makes modelling particularly easy
models <- mtcars %>%
  nest_by(cyl) %>%
  mutate(model = list(lm(mpg ~ wt, data = data)))
models

models %>% summarise(rsq = summary(model)$r.squared)
# This is particularly elegant with the broom functions
if (requireNamespace("broom", quietly = TRUE)) {
  models %>% summarise(broom::glance(model))
  models %>% summarise(broom::tidy(model))
}

# Note that you can also summarise to unnest the data
models %>% summarise(data)



