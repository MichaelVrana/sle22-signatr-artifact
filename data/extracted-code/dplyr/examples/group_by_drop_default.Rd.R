library(dplyr)


### Name: group_by_drop_default
### Title: Default value for .drop argument of group_by
### Aliases: group_by_drop_default
### Keywords: internal

### ** Examples

group_by_drop_default(iris)

iris %>%
  group_by(Species) %>%
  group_by_drop_default()

iris %>%
  group_by(Species, .drop = FALSE) %>%
  group_by_drop_default()




