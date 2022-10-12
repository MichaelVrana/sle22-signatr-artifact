library(ggplot2)


### Name: guide_bins
### Title: A binned version of guide_legend
### Aliases: guide_bins

### ** Examples

p <- ggplot(mtcars) +
  geom_point(aes(disp, mpg, size = hp)) +
  scale_size_binned()

# Standard look
p

# Remove the axis or style it
p + guides(size = guide_bins(axis = FALSE))

p + guides(size = guide_bins(show.limits = TRUE))

p + guides(size = guide_bins(
  axis.arrow = arrow(length = unit(1.5, 'mm'), ends = 'both')
))

# Guides are merged together if possible
ggplot(mtcars) +
  geom_point(aes(disp, mpg, size = hp, colour = hp)) +
  scale_size_binned() +
  scale_colour_binned(guide = "bins")




