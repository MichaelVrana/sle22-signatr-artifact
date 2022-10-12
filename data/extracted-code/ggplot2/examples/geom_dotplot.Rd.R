library(ggplot2)


### Name: geom_dotplot
### Title: Dot plot
### Aliases: geom_dotplot

### ** Examples

ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot()

ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5)

# Use fixed-width bins
ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(method="histodot", binwidth = 1.5)

# Some other stacking methods
ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5, stackdir = "center")

ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5, stackdir = "centerwhole")

# y axis isn't really meaningful, so hide it
ggplot(mtcars, aes(x = mpg)) + geom_dotplot(binwidth = 1.5) +
  scale_y_continuous(NULL, breaks = NULL)

# Overlap dots vertically
ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5, stackratio = .7)

# Expand dot diameter
ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5, dotsize = 1.25)

# Change dot fill colour, stroke width
ggplot(mtcars, aes(x = mpg)) +
  geom_dotplot(binwidth = 1.5, fill = "white", stroke = 2)

## No test: 
##D # Examples with stacking along y axis instead of x
##D ggplot(mtcars, aes(x = 1, y = mpg)) +
##D   geom_dotplot(binaxis = "y", stackdir = "center")
##D 
##D ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
##D   geom_dotplot(binaxis = "y", stackdir = "center")
##D 
##D ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
##D   geom_dotplot(binaxis = "y", stackdir = "centerwhole")
##D 
##D ggplot(mtcars, aes(x = factor(vs), fill = factor(cyl), y = mpg)) +
##D   geom_dotplot(binaxis = "y", stackdir = "center", position = "dodge")
##D 
##D # binpositions="all" ensures that the bins are aligned between groups
##D ggplot(mtcars, aes(x = factor(am), y = mpg)) +
##D   geom_dotplot(binaxis = "y", stackdir = "center", binpositions="all")
##D 
##D # Stacking multiple groups, with different fill
##D ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
##D   geom_dotplot(stackgroups = TRUE, binwidth = 1, binpositions = "all")
##D 
##D ggplot(mtcars, aes(x = mpg, fill = factor(cyl))) +
##D   geom_dotplot(stackgroups = TRUE, binwidth = 1, method = "histodot")
##D 
##D ggplot(mtcars, aes(x = 1, y = mpg, fill = factor(cyl))) +
##D   geom_dotplot(binaxis = "y", stackgroups = TRUE, binwidth = 1, method = "histodot")
## End(No test)



