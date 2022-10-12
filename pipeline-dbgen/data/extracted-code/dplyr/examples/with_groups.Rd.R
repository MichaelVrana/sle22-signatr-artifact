library(dplyr)


### Name: with_groups
### Title: Perform an operation with temporary groups
### Aliases: with_groups

### ** Examples

df <- tibble(g = c(1, 1, 2, 2, 3), x = runif(5))
df %>%
  with_groups(g, mutate, x_mean = mean(x))
df %>%
  with_groups(g, ~ mutate(.x, x1 = first(x)))

df %>%
  group_by(g) %>%
  with_groups(NULL, mutate, x_mean = mean(x))

# NB: grouping can't be restored if you remove the grouping variables
df %>%
  group_by(g) %>%
  with_groups(NULL, mutate, g = NULL)



