library(tab)


### Name: tabreg
### Title: Create Regression Table from Betas and Standard Errors
### Aliases: tabreg

### ** Examples

# Create summary table for mtcars regression
fit <- lm(mpg ~ wt + hp + drat, data = mtcars)
tabreg(
  betas = fit$coef,
  varcov = vcov(fit),
  labels = c("Intercept", "Weight", "HP", "Rear axle ratio")
)





