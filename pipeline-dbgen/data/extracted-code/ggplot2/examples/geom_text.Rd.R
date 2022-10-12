library(ggplot2)


### Name: geom_label
### Title: Text
### Aliases: geom_label geom_text

### ** Examples

p <- ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars)))

p + geom_text()
# Avoid overlaps
p + geom_text(check_overlap = TRUE)
# Labels with background
p + geom_label()
# Change size of the label
p + geom_text(size = 10)

# Set aesthetics to fixed value
p +
  geom_point() +
  geom_text(hjust = 0, nudge_x = 0.05)
p +
  geom_point() +
  geom_text(vjust = 0, nudge_y = 0.5)
p +
  geom_point() +
  geom_text(angle = 45)
## Not run: 
##D # Doesn't work on all systems
##D p +
##D   geom_text(family = "Times New Roman")
## End(Not run)

# Add aesthetic mappings
p + geom_text(aes(colour = factor(cyl)))
p + geom_text(aes(colour = factor(cyl))) +
  scale_colour_discrete(l = 40)
p + geom_label(aes(fill = factor(cyl)), colour = "white", fontface = "bold")

p + geom_text(aes(size = wt))
# Scale height of text, rather than sqrt(height)
p +
  geom_text(aes(size = wt)) +
  scale_radius(range = c(3,6))

# You can display expressions by setting parse = TRUE.  The
# details of the display are described in ?plotmath, but note that
# geom_text uses strings, not expressions.
p +
  geom_text(
    aes(label = paste(wt, "^(", cyl, ")", sep = "")),
    parse = TRUE
  )

# Add a text annotation
p +
  geom_text() +
  annotate(
    "text", label = "plot mpg vs. wt",
    x = 2, y = 15, size = 8, colour = "red"
  )

## No test: 
##D # Aligning labels and bars --------------------------------------------------
##D df <- data.frame(
##D   x = factor(c(1, 1, 2, 2)),
##D   y = c(1, 3, 2, 1),
##D   grp = c("a", "b", "a", "b")
##D )
##D 
##D # ggplot2 doesn't know you want to give the labels the same virtual width
##D # as the bars:
##D ggplot(data = df, aes(x, y, group = grp)) +
##D   geom_col(aes(fill = grp), position = "dodge") +
##D   geom_text(aes(label = y), position = "dodge")
##D # So tell it:
##D ggplot(data = df, aes(x, y, group = grp)) +
##D   geom_col(aes(fill = grp), position = "dodge") +
##D   geom_text(aes(label = y), position = position_dodge(0.9))
##D # Use you can't nudge and dodge text, so instead adjust the y position
##D ggplot(data = df, aes(x, y, group = grp)) +
##D   geom_col(aes(fill = grp), position = "dodge") +
##D   geom_text(
##D     aes(label = y, y = y + 0.05),
##D     position = position_dodge(0.9),
##D     vjust = 0
##D   )
##D 
##D # To place text in the middle of each bar in a stacked barplot, you
##D # need to set the vjust parameter of position_stack()
##D ggplot(data = df, aes(x, y, group = grp)) +
##D  geom_col(aes(fill = grp)) +
##D  geom_text(aes(label = y), position = position_stack(vjust = 0.5))
##D 
##D # Justification -------------------------------------------------------------
##D df <- data.frame(
##D   x = c(1, 1, 2, 2, 1.5),
##D   y = c(1, 2, 1, 2, 1.5),
##D   text = c("bottom-left", "bottom-right", "top-left", "top-right", "center")
##D )
##D ggplot(df, aes(x, y)) +
##D   geom_text(aes(label = text))
##D ggplot(df, aes(x, y)) +
##D   geom_text(aes(label = text), vjust = "inward", hjust = "inward")
## End(No test)



