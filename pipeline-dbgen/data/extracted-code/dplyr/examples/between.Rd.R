library(dplyr)


### Name: between
### Title: Do values in a numeric vector fall in specified range?
### Aliases: between

### ** Examples

between(1:12, 7, 9)

x <- rnorm(1e2)
x[between(x, -1, 1)]

## Or on a tibble using filter
filter(starwars, between(height, 100, 150))



