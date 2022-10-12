library(dplyr)


### Name: combine
### Title: Combine vectors
### Aliases: combine
### Keywords: internal

### ** Examples

f1 <- factor("a")
f2 <- factor("b")

combine(f1, f2)
# ->
vctrs::vec_c(f1, f1)

combine(list(f1, f2))
# ->
vctrs::vec_c(!!!list(f1, f2))



