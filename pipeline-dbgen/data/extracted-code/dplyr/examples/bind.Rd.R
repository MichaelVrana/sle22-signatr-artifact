library(dplyr)


### Name: bind
### Title: Efficiently bind multiple data frames by row and column
### Aliases: bind bind_rows bind_cols

### ** Examples

one <- starwars[1:4, ]
two <- starwars[9:12, ]

# You can supply data frames as arguments:
bind_rows(one, two)

# The contents of lists are spliced automatically:
bind_rows(list(one, two))
bind_rows(split(starwars, starwars$homeworld))
bind_rows(list(one, two), list(two, one))


# In addition to data frames, you can supply vectors. In the rows
# direction, the vectors represent rows and should have inner
# names:
bind_rows(
  c(a = 1, b = 2),
  c(a = 3, b = 4)
)

# You can mix vectors and data frames:
bind_rows(
  c(a = 1, b = 2),
  tibble(a = 3:4, b = 5:6),
  c(a = 7, b = 8)
)


# When you supply a column name with the `.id` argument, a new
# column is created to link each row to its original data frame
bind_rows(list(one, two), .id = "id")
bind_rows(list(a = one, b = two), .id = "id")
bind_rows("group 1" = one, "group 2" = two, .id = "groups")

# Columns don't need to match when row-binding
bind_rows(tibble(x = 1:3), tibble(y = 1:4))
## Not run: 
##D # Rows do need to match when column-binding
##D bind_cols(tibble(x = 1:3), tibble(y = 1:2))
##D 
##D # even with 0 columns
##D bind_cols(tibble(x = 1:3), tibble())
## End(Not run)

bind_cols(one, two)
bind_cols(list(one, two))



