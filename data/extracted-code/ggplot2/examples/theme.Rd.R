library(ggplot2)


### Name: theme
### Title: Modify components of a theme
### Aliases: theme

### ** Examples

p1 <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  labs(title = "Fuel economy declines as weight increases")
p1

# Plot ---------------------------------------------------------------------
p1 + theme(plot.title = element_text(size = rel(2)))
p1 + theme(plot.background = element_rect(fill = "green"))

# Panels --------------------------------------------------------------------

p1 + theme(panel.background = element_rect(fill = "white", colour = "grey50"))
p1 + theme(panel.border = element_rect(linetype = "dashed", fill = NA))
p1 + theme(panel.grid.major = element_line(colour = "black"))
p1 + theme(
  panel.grid.major.y = element_blank(),
  panel.grid.minor.y = element_blank()
)

# Put gridlines on top of data
p1 + theme(
  panel.background = element_rect(fill = NA),
  panel.grid.major = element_line(colour = "grey50"),
  panel.ontop = TRUE
)

# Axes ----------------------------------------------------------------------
# Change styles of axes texts and lines
p1 + theme(axis.line = element_line(size = 3, colour = "grey80"))
p1 + theme(axis.text = element_text(colour = "blue"))
p1 + theme(axis.ticks = element_line(size = 2))

# Change the appearance of the y-axis title
p1 + theme(axis.title.y = element_text(size = rel(1.5), angle = 90))

# Make ticks point outwards on y-axis and inwards on x-axis
p1 + theme(
  axis.ticks.length.y = unit(.25, "cm"),
  axis.ticks.length.x = unit(-.25, "cm"),
  axis.text.x = element_text(margin = margin(t = .3, unit = "cm"))
)

## No test: 
##D # Legend --------------------------------------------------------------------
##D p2 <- ggplot(mtcars, aes(wt, mpg)) +
##D   geom_point(aes(colour = factor(cyl), shape = factor(vs))) +
##D   labs(
##D     x = "Weight (1000 lbs)",
##D     y = "Fuel economy (mpg)",
##D     colour = "Cylinders",
##D     shape = "Transmission"
##D    )
##D p2
##D 
##D # Position
##D p2 + theme(legend.position = "none")
##D p2 + theme(legend.justification = "top")
##D p2 + theme(legend.position = "bottom")
##D 
##D # Or place legends inside the plot using relative coordinates between 0 and 1
##D # legend.justification sets the corner that the position refers to
##D p2 + theme(
##D   legend.position = c(.95, .95),
##D   legend.justification = c("right", "top"),
##D   legend.box.just = "right",
##D   legend.margin = margin(6, 6, 6, 6)
##D )
##D 
##D # The legend.box properties work similarly for the space around
##D # all the legends
##D p2 + theme(
##D   legend.box.background = element_rect(),
##D   legend.box.margin = margin(6, 6, 6, 6)
##D )
##D 
##D # You can also control the display of the keys
##D # and the justification related to the plot area can be set
##D p2 + theme(legend.key = element_rect(fill = "white", colour = "black"))
##D p2 + theme(legend.text = element_text(size = 8, colour = "red"))
##D p2 + theme(legend.title = element_text(face = "bold"))
##D 
##D # Strips --------------------------------------------------------------------
##D 
##D p3 <- ggplot(mtcars, aes(wt, mpg)) +
##D   geom_point() +
##D   facet_wrap(~ cyl)
##D p3
##D 
##D p3 + theme(strip.background = element_rect(colour = "black", fill = "white"))
##D p3 + theme(strip.text.x = element_text(colour = "white", face = "bold"))
##D p3 + theme(panel.spacing = unit(1, "lines"))
## End(No test)



