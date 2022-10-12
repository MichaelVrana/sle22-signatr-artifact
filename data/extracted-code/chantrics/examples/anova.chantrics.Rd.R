library(chantrics)


### Name: anova.chantrics
### Title: ANOVA tables: compare nested models
### Aliases: anova.chantrics

### ** Examples


# from Introducing Chandwich.
set.seed(123)
x <- rnorm(250)
y <- rnbinom(250, mu = exp(1 + x), size = 1)
fm_pois <- glm(y ~ x + I(x^2), family = poisson)
fm_pois_adj <- adj_loglik(fm_pois)
fm_pois_small_adj <- update(fm_pois_adj, formula = . ~ . - I(x^2))
fm_pois_smallest_adj <- update(fm_pois_adj, formula = . ~ 1)

anova(fm_pois_adj, fm_pois_small_adj, fm_pois_smallest_adj)
# use different types of adjustment with type, default is "vertical"
anova(fm_pois_adj, fm_pois_small_adj, fm_pois_smallest_adj, type = "cholesky")

# sequential anova
anova(fm_pois_adj)



