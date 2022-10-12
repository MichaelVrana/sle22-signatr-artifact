library(dplyr)


### Name: funs
### Title: Create a list of function calls
### Aliases: funs
### Keywords: internal

### ** Examples

funs("mean", mean(., na.rm = TRUE))
# ->
list(mean = mean, mean = ~ mean(.x, na.rm = TRUE))

funs(m1 = mean, m2 = "mean", m3 = mean(., na.rm = TRUE))
# ->
list(m1 = mean, m2 = "mean", m3 = ~ mean(.x, na.rm = TRUE))



