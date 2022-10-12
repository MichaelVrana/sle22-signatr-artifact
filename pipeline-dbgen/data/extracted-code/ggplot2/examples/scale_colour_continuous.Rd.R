library(ggplot2)


### Name: scale_colour_continuous
### Title: Continuous and binned colour scales
### Aliases: scale_colour_continuous scale_fill_continuous
###   scale_colour_binned scale_fill_binned scale_color_continuous
###   scale_color_binned

### ** Examples

v <- ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
geom_tile()
v

v + scale_fill_continuous(type = "gradient")
v + scale_fill_continuous(type = "viridis")

# The above are equivalent to
v + scale_fill_gradient()
v + scale_fill_viridis_c()

# To make a binned version of this plot
v + scale_fill_binned(type = "viridis")

# Set a different default scale using the options
# mechanism
tmp <- getOption("ggplot2.continuous.fill") # store current setting
options(ggplot2.continuous.fill = scale_fill_distiller)
v
options(ggplot2.continuous.fill = tmp) # restore previous setting



