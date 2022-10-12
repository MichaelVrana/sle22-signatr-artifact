library(chantrics)


### Name: hurdle
### Title: Loglikelihood adjustments for pscl::hurdle fits
### Aliases: hurdle
### Keywords: internal

### ** Examples

# hurdle model from AER, pg. 139-140
library(pscl)
data("RecreationDemand", package = "AER")
rd_hurdle <- hurdle(trips ~ . | quality + income,
  data = RecreationDemand,
  dist = "negbin", x = TRUE
)
summary(rd_hurdle)

# adjust model
# adj_loglik(rd_hurdle)



