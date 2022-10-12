library(ggplot2)


### Name: scale_colour_steps
### Title: Binned gradient colour scales
### Aliases: scale_colour_steps scale_colour_steps2 scale_colour_stepsn
###   scale_fill_steps scale_fill_steps2 scale_fill_stepsn
###   scale_color_steps scale_color_steps2 scale_color_stepsn

### ** Examples

df <- data.frame(
  x = runif(100),
  y = runif(100),
  z1 = rnorm(100)
)

# Use scale_colour_steps for a standard binned gradient
ggplot(df, aes(x, y)) +
  geom_point(aes(colour = z1)) +
  scale_colour_steps()

# Get a divergent binned scale with the *2 variant
ggplot(df, aes(x, y)) +
  geom_point(aes(colour = z1)) +
  scale_colour_steps2()

# Define your own colour ramp to extract binned colours from
ggplot(df, aes(x, y)) +
  geom_point(aes(colour = z1)) +
  scale_colour_stepsn(colours = terrain.colors(10))



