library(ggplot2)


### Name: register_theme_elements
### Title: Define and register new theme elements
### Aliases: register_theme_elements reset_theme_settings get_element_tree
###   el_def
### Keywords: internal

### ** Examples

# Let's assume a package `ggxyz` wants to provide an easy way to add annotations to
# plot panels. To do so, it registers a new theme element `ggxyz.panel.annotation`
register_theme_elements(
  ggxyz.panel.annotation = element_text(color = "blue", hjust = 0.95, vjust = 0.05),
  element_tree = list(ggxyz.panel.annotation = el_def("element_text", "text"))
)

# Now the package can define a new coord that includes a panel annotation
coord_annotate <- function(label = "panel annotation") {
  ggproto(NULL, CoordCartesian,
    limits = list(x = NULL, y = NULL),
    expand = TRUE,
    default = FALSE,
    clip = "on",
    render_fg = function(panel_params, theme) {
      element_render(theme, "ggxyz.panel.annotation", label = label)
    }
  )
}

# Example plot with this new coord
df <- data.frame(x = 1:3, y = 1:3)
ggplot(df, aes(x, y)) +
  geom_point() +
  coord_annotate("annotation in blue")

# Revert to the original ggplot2 settings
reset_theme_settings()



