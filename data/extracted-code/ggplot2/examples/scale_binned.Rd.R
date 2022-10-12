library(ggplot2)


### Name: scale_binned
### Title: Positional scales for binning continuous data (x & y)
### Aliases: scale_x_binned scale_y_binned

### ** Examples

# Create a histogram by binning the x-axis
ggplot(mtcars) +
  geom_bar(aes(mpg)) +
  scale_x_binned()



