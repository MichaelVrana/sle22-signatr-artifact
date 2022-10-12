library(dplyr)


### Name: c_across
### Title: Combine values from multiple columns
### Aliases: c_across

### ** Examples

df <- tibble(id = 1:4, w = runif(4), x = runif(4), y = runif(4), z = runif(4))
df %>%
  rowwise() %>%
  mutate(
    sum = sum(c_across(w:z)),
    sd = sd(c_across(w:z))
 )



