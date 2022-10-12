library(dplyr)


### Name: do
### Title: Do anything
### Aliases: do
### Keywords: internal

### ** Examples

# do() with unnamed arguments becomes summarise()
# . becomes across()
by_cyl <- mtcars %>% group_by(cyl)
by_cyl %>% do(head(., 2))
# ->
by_cyl %>% summarise(head(across(), 2))
by_cyl %>% slice_head(n = 2)

# Can refer to variables directly
by_cyl %>% do(mean = mean(.$vs))
# ->
by_cyl %>% summarise(mean = mean(vs))

# do() with named arguments becomes nest_by() + mutate() & list()
models <- by_cyl %>% do(mod = lm(mpg ~ disp, data = .))
# ->
models <- mtcars %>%
  nest_by(cyl) %>%
  mutate(mod = list(lm(mpg ~ disp, data = data)))
models %>% summarise(rsq = summary(mod)$r.squared)

# use broom to turn models into data
models %>% do(data.frame(
  var = names(coef(.$mod)),
  coef(summary(.$mod)))
)
# ->
if (requireNamespace("broom")) {
  models %>% summarise(broom::tidy(mod))
}



