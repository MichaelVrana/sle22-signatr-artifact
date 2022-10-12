library(dplyr)


### Name: top_n
### Title: Select top (or bottom) n rows (by value)
### Aliases: top_n top_frac
### Keywords: internal

### ** Examples

df <- data.frame(x = c(6, 4, 1, 10, 3, 1, 1))

df %>% top_n(2)  # highest values
df %>% top_n(-2) # lowest values
# now use
df %>% slice_max(x, n = 2)
df %>% slice_min(x, n = 2)

# top_frac() -> prop argument of slice_min()/slice_max()
df %>% top_frac(.5)
# ->
df %>% slice_max(x, prop = 0.5)



