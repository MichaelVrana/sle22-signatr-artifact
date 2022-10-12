library(ggplot2)


### Name: labellers
### Title: Useful labeller functions
### Aliases: labellers label_value label_both label_context label_parsed
###   label_wrap_gen

### ** Examples

mtcars$cyl2 <- factor(mtcars$cyl, labels = c("alpha", "beta", "gamma"))
p <- ggplot(mtcars, aes(wt, mpg)) + geom_point()

# The default is label_value
p + facet_grid(. ~ cyl, labeller = label_value)

## No test: 
##D # Displaying both the values and the variables
##D p + facet_grid(. ~ cyl, labeller = label_both)
##D 
##D # Displaying only the values or both the values and variables
##D # depending on whether multiple factors are facetted over
##D p + facet_grid(am ~ vs+cyl, labeller = label_context)
##D 
##D # Interpreting the labels as plotmath expressions
##D p + facet_grid(. ~ cyl2)
##D p + facet_grid(. ~ cyl2, labeller = label_parsed)
## End(No test)



