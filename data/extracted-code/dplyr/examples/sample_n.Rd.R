library(dplyr)


### Name: sample_n
### Title: Sample n rows from a table
### Aliases: sample_n sample_frac
### Keywords: internal

### ** Examples

by_cyl <- mtcars %>% group_by(cyl)

# sample_n() -> slice_sample() ----------------------------------------------
sample_n(mtcars, 10)
sample_n(mtcars, 50, replace = TRUE)
sample_n(mtcars, 10, weight = mpg)

# Changes:
# * explicitly name the `n` argument,
# * the `weight` argument is now `weight_by`.

slice_sample(mtcars, n = 10)
slice_sample(mtcars, n = 50, replace = TRUE)
slice_sample(mtcars, n = 10, weight_by = mpg)

# Note that sample_n() would error if n was bigger than the group size
# slice_sample() will just use the available rows for consistency with
# the other slice helpers like slice_head()

# sample_frac() -> slice_sample() -------------------------------------------
sample_frac(mtcars)
sample_frac(mtcars, replace = TRUE)

# Changes:
# * use prop = 1 to randomly sample all rows

slice_sample(mtcars, prop = 1)
slice_sample(mtcars, prop = 1, replace = TRUE)




