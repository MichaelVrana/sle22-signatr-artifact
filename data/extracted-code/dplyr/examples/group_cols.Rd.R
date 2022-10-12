library(dplyr)


### Name: group_cols
### Title: Select grouping variables
### Aliases: group_cols

### ** Examples

gdf <- iris %>% group_by(Species)
gdf %>% select(group_cols())

# Remove the grouping variables from mutate selections:
gdf %>% mutate_at(vars(-group_cols()), `/`, 100)
# -> No longer necessary with across()
gdf %>% mutate(across(everything(), ~ . / 100))



