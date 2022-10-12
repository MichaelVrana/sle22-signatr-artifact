library(dplyr)


### Name: group_data
### Title: Grouping metadata
### Aliases: group_data group_keys group_rows group_indices group_vars
###   groups group_size n_groups
### Keywords: internal

### ** Examples

df <- tibble(x = c(1,1,2,2))
group_vars(df)
group_rows(df)
group_data(df)
group_indices(df)

gf <- group_by(df, x)
group_vars(gf)
group_rows(gf)
group_data(gf)
group_indices(gf)



