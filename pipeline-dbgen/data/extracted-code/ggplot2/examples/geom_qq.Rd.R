library(ggplot2)


### Name: geom_qq_line
### Title: A quantile-quantile plot
### Aliases: geom_qq_line stat_qq_line geom_qq stat_qq

### ** Examples

## No test: 
##D df <- data.frame(y = rt(200, df = 5))
##D p <- ggplot(df, aes(sample = y))
##D p + stat_qq() + stat_qq_line()
##D 
##D # Use fitdistr from MASS to estimate distribution params
##D params <- as.list(MASS::fitdistr(df$y, "t")$estimate)
##D ggplot(df, aes(sample = y)) +
##D   stat_qq(distribution = qt, dparams = params["df"]) +
##D   stat_qq_line(distribution = qt, dparams = params["df"])
##D 
##D # Using to explore the distribution of a variable
##D ggplot(mtcars, aes(sample = mpg)) +
##D   stat_qq() +
##D   stat_qq_line()
##D ggplot(mtcars, aes(sample = mpg, colour = factor(cyl))) +
##D   stat_qq() +
##D   stat_qq_line()
## End(No test)



