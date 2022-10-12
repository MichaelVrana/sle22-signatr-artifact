library(ggplot2)


### Name: get_alt_text
### Title: Extract alt text from a plot
### Aliases: get_alt_text alt_text

### ** Examples

p <- ggplot(mpg, aes(displ, hwy)) +
  geom_point()

# Returns an empty string
get_alt_text(p)

# A user provided alt text
p <- p + labs(
  alt = paste("A scatterplot showing the negative correlation between engine",
              "displacement as a function of highway miles per gallon")
)

get_alt_text(p)




