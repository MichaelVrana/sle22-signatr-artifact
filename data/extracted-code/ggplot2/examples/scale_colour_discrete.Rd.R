library(ggplot2)


### Name: scale_colour_discrete
### Title: Discrete colour scales
### Aliases: scale_colour_discrete scale_fill_discrete scale_color_discrete

### ** Examples

# Template function for creating densities grouped by a variable
cty_by_var <- function(var) {
  ggplot(mpg, aes(cty, colour = factor({{var}}), fill = factor({{var}}))) +
    geom_density(alpha = 0.2)
}

# The default, scale_fill_hue(), is not colour-blind safe
cty_by_var(class)

# (Temporarily) set the default to Okabe-Ito (which is colour-blind safe)
okabe <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
withr::with_options(
  list(ggplot2.discrete.fill = okabe),
  print(cty_by_var(class))
)

# Define a collection of palettes to alter the default based on number of levels to encode
discrete_palettes <- list(
  c("skyblue", "orange"),
  RColorBrewer::brewer.pal(3, "Set2"),
  RColorBrewer::brewer.pal(6, "Accent")
)
withr::with_options(
  list(ggplot2.discrete.fill = discrete_palettes), {
  # 1st palette is used when there 1-2 levels (e.g., year)
  print(cty_by_var(year))
  # 2nd palette is used when there are 3 levels
  print(cty_by_var(drv))
  # 3rd palette is used when there are 4-6 levels
  print(cty_by_var(fl))
})




