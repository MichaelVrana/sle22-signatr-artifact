library(ggplot2)


### Name: scale_colour_brewer
### Title: Sequential, diverging and qualitative colour scales from
###   ColorBrewer
### Aliases: scale_colour_brewer scale_fill_brewer scale_colour_distiller
###   scale_fill_distiller scale_colour_fermenter scale_fill_fermenter
###   scale_color_brewer scale_color_distiller scale_color_fermenter

### ** Examples

dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
(d <- ggplot(dsamp, aes(carat, price)) +
  geom_point(aes(colour = clarity)))
d + scale_colour_brewer()

# Change scale label
d + scale_colour_brewer("Diamond\nclarity")

# Select brewer palette to use, see ?scales::brewer_pal for more details
d + scale_colour_brewer(palette = "Greens")
d + scale_colour_brewer(palette = "Set1")

## No test: 
##D # scale_fill_brewer works just the same as
##D # scale_colour_brewer but for fill colours
##D p <- ggplot(diamonds, aes(x = price, fill = cut)) +
##D   geom_histogram(position = "dodge", binwidth = 1000)
##D p + scale_fill_brewer()
##D # the order of colour can be reversed
##D p + scale_fill_brewer(direction = -1)
##D # the brewer scales look better on a darker background
##D p +
##D   scale_fill_brewer(direction = -1) +
##D   theme_dark()
## End(No test)

# Use distiller variant with continous data
v <- ggplot(faithfuld) +
  geom_tile(aes(waiting, eruptions, fill = density))
v
v + scale_fill_distiller()
v + scale_fill_distiller(palette = "Spectral")

# or use blender variants to discretise continuous data
v + scale_fill_fermenter()




