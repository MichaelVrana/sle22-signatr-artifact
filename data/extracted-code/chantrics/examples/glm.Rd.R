library(chantrics)


### Name: glm
### Title: Loglikelihood adjustments for glm fits
### Aliases: glm glm.nb

### ** Examples

# binomial example from Applied Econometrics in R, Kleiber/Zeileis (2008)
# ==  probit  ==
data("SwissLabor", package = "AER")
swiss_probit <- glm(participation ~ . + I(age^2),
  data = SwissLabor,
  family = binomial(link = "probit")
)
summary(swiss_probit)
swiss_probit_adj <- adj_loglik(swiss_probit)
summary(swiss_probit_adj)

# == logit ==
swiss_logit <- glm(participation ~ . + I(age^2),
  data = SwissLabor,
  family = binomial(link = "logit")
)
summary(swiss_logit)
swiss_logit_adj <- adj_loglik(swiss_logit)
summary(swiss_logit_adj)



