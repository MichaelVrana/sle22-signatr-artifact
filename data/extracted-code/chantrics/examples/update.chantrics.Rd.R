library(chantrics)


### Name: update.chantrics
### Title: Update, re-fit and re-adjust a Model Call
### Aliases: update.chantrics

### ** Examples

# from Introducing Chandwich.
set.seed(123)
x <- rnorm(250)
y <- rnbinom(250, mu = exp(1 + x), size = 1)
fm_pois <- glm(y ~ x + I(x^2), family = poisson)
fm_pois_adj <- adj_loglik(fm_pois)
fm_pois_small_adj <- update(fm_pois_adj, formula = . ~ . - I(x^2))
summary(fm_pois_small_adj)
fm_pois_smallest_adj <- update(fm_pois_adj, formula = . ~ 1)
summary(fm_pois_smallest_adj)



