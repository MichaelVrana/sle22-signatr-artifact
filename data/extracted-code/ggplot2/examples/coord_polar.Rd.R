library(ggplot2)


### Name: coord_polar
### Title: Polar coordinates
### Aliases: coord_polar

### ** Examples

# NOTE: Use these plots with caution - polar coordinates has
# major perceptual problems.  The main point of these examples is
# to demonstrate how these common plots can be described in the
# grammar.  Use with EXTREME caution.

#' # A pie chart = stacked bar chart + polar coordinates
pie <- ggplot(mtcars, aes(x = factor(1), fill = factor(cyl))) +
 geom_bar(width = 1)
pie + coord_polar(theta = "y")

## No test: 
##D 
##D # A coxcomb plot = bar chart + polar coordinates
##D cxc <- ggplot(mtcars, aes(x = factor(cyl))) +
##D   geom_bar(width = 1, colour = "black")
##D cxc + coord_polar()
##D # A new type of plot?
##D cxc + coord_polar(theta = "y")
##D 
##D # The bullseye chart
##D pie + coord_polar()
##D 
##D # Hadley's favourite pie chart
##D df <- data.frame(
##D   variable = c("does not resemble", "resembles"),
##D   value = c(20, 80)
##D )
##D ggplot(df, aes(x = "", y = value, fill = variable)) +
##D   geom_col(width = 1) +
##D   scale_fill_manual(values = c("red", "yellow")) +
##D   coord_polar("y", start = pi / 3) +
##D   labs(title = "Pac man")
##D 
##D # Windrose + doughnut plot
##D if (require("ggplot2movies")) {
##D movies$rrating <- cut_interval(movies$rating, length = 1)
##D movies$budgetq <- cut_number(movies$budget, 4)
##D 
##D doh <- ggplot(movies, aes(x = rrating, fill = budgetq))
##D 
##D # Wind rose
##D doh + geom_bar(width = 1) + coord_polar()
##D # Race track plot
##D doh + geom_bar(width = 0.9, position = "fill") + coord_polar(theta = "y")
##D }
## End(No test)



