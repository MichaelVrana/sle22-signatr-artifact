library(dplyr)


### Name: filter-joins
### Title: Filtering joins
### Aliases: filter-joins semi_join semi_join.data.frame anti_join
###   anti_join.data.frame

### ** Examples

# "Filtering" joins keep cases from the LHS
band_members %>% semi_join(band_instruments)
band_members %>% anti_join(band_instruments)

# To suppress the message about joining variables, supply `by`
band_members %>% semi_join(band_instruments, by = "name")
# This is good practice in production code



