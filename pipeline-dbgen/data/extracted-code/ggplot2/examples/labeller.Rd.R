library(ggplot2)


### Name: labeller
### Title: Construct labelling specification
### Aliases: labeller

### ** Examples

## No test: 
##D p1 <- ggplot(mtcars, aes(x = mpg, y = wt)) + geom_point()
##D 
##D # You can assign different labellers to variables:
##D p1 + facet_grid(
##D   vs + am ~ gear,
##D   labeller = labeller(vs = label_both, am = label_value)
##D )
##D 
##D # Or whole margins:
##D p1 + facet_grid(
##D   vs + am ~ gear,
##D   labeller = labeller(.rows = label_both, .cols = label_value)
##D )
##D 
##D # You can supply functions operating on strings:
##D capitalize <- function(string) {
##D   substr(string, 1, 1) <- toupper(substr(string, 1, 1))
##D   string
##D }
##D p2 <- ggplot(msleep, aes(x = sleep_total, y = awake)) + geom_point()
##D p2 + facet_grid(vore ~ conservation, labeller = labeller(vore = capitalize))
##D 
##D # Or use character vectors as lookup tables:
##D conservation_status <- c(
##D   cd = "Conservation Dependent",
##D   en = "Endangered",
##D   lc = "Least concern",
##D   nt = "Near Threatened",
##D   vu = "Vulnerable",
##D   domesticated = "Domesticated"
##D )
##D ## Source: http://en.wikipedia.org/wiki/Wikipedia:Conservation_status
##D 
##D p2 + facet_grid(vore ~ conservation, labeller = labeller(
##D   .default = capitalize,
##D   conservation = conservation_status
##D ))
##D 
##D # In the following example, we rename the levels to the long form,
##D # then apply a wrap labeller to the columns to prevent cropped text
##D idx <- match(msleep$conservation, names(conservation_status))
##D msleep$conservation2 <- conservation_status[idx]
##D 
##D p3 <- ggplot(msleep, aes(x = sleep_total, y = awake)) + geom_point()
##D p3 +
##D   facet_grid(vore ~ conservation2,
##D     labeller = labeller(conservation2 = label_wrap_gen(10))
##D   )
##D 
##D # labeller() is especially useful to act as a global labeller. You
##D # can set it up once and use it on a range of different plots with
##D # different facet specifications.
##D 
##D global_labeller <- labeller(
##D   vore = capitalize,
##D   conservation = conservation_status,
##D   conservation2 = label_wrap_gen(10),
##D   .default = label_both
##D )
##D 
##D p2 + facet_grid(vore ~ conservation, labeller = global_labeller)
##D p3 + facet_wrap(~conservation2, labeller = global_labeller)
## End(No test)



