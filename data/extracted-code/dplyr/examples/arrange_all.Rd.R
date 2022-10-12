library(dplyr)


### Name: arrange_all
### Title: Arrange rows by a selection of variables
### Aliases: arrange_all arrange_at arrange_if

### ** Examples

df <- as_tibble(mtcars)
arrange_all(df)
# ->
arrange(df, across())

arrange_all(df, desc)
# ->
arrange(df, across(everything(), desc))



