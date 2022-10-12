library(dplyr)


### Name: location
### Title: Print the location in memory of a data frame
### Aliases: location changes
### Keywords: internal

### ** Examples

location(mtcars)
# ->
lobstr::ref(mtcars)

mtcars2 <- mutate(mtcars, cyl2 = cyl * 2)
# ->
lobstr::ref(mtcars2)

changes(mtcars, mtcars2)
# ->
lobstr::ref(mtcars, mtcars2)



