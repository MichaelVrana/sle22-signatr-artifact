library(ggplot2)


### Name: guide_legend
### Title: Legend guide
### Aliases: guide_legend

### ** Examples

## No test: 
##D df <- expand.grid(X1 = 1:10, X2 = 1:10)
##D df$value <- df$X1 * df$X2
##D 
##D p1 <- ggplot(df, aes(X1, X2)) + geom_tile(aes(fill = value))
##D p2 <- p1 + geom_point(aes(size = value))
##D 
##D # Basic form
##D p1 + scale_fill_continuous(guide = guide_legend())
##D 
##D # Control styles
##D 
##D # title position
##D p1 + guides(fill = guide_legend(title = "LEFT", title.position = "left"))
##D 
##D # title text styles via element_text
##D p1 + guides(fill =
##D   guide_legend(
##D     title.theme = element_text(
##D       size = 15,
##D       face = "italic",
##D       colour = "red",
##D       angle = 0
##D     )
##D   )
##D )
##D 
##D # label position
##D p1 + guides(fill = guide_legend(label.position = "left", label.hjust = 1))
##D 
##D # label styles
##D p1 +
##D   scale_fill_continuous(
##D     breaks = c(5, 10, 15),
##D     labels = paste("long", c(5, 10, 15)),
##D     guide = guide_legend(
##D       direction = "horizontal",
##D       title.position = "top",
##D       label.position = "bottom",
##D       label.hjust = 0.5,
##D       label.vjust = 1,
##D       label.theme = element_text(angle = 90)
##D     )
##D   )
##D 
##D # Set aesthetic of legend key
##D # very low alpha value make it difficult to see legend key
##D p3 <- ggplot(mtcars, aes(vs, am, colour = factor(cyl))) +
##D   geom_jitter(alpha = 1/5, width = 0.01, height = 0.01)
##D p3
##D # override.aes overwrites the alpha
##D p3 + guides(colour = guide_legend(override.aes = list(alpha = 1)))
##D 
##D # multiple row/col legends
##D df <- data.frame(x = 1:20, y = 1:20, color = letters[1:20])
##D p <- ggplot(df, aes(x, y)) +
##D   geom_point(aes(colour = color))
##D p + guides(col = guide_legend(nrow = 8))
##D p + guides(col = guide_legend(ncol = 8))
##D p + guides(col = guide_legend(nrow = 8, byrow = TRUE))
##D 
##D # reversed order legend
##D p + guides(col = guide_legend(reverse = TRUE))
## End(No test)



