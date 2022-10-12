library(aster)


### Name: sim
### Title: Simulated Life History Data
### Aliases: sim beta.true mu.true phi.true theta.true fam pred vars ladata
###   redata
### Keywords: datasets

### ** Examples

data(sim)
## Not run: 
##D ### CRAN policy says examples must take < 5 sec.  This doesn't.
##D out6 <- aster(resp ~ varb + 0 + z1 + z2 + I(z1^2) + I(z1*z2) + I(z2^2),
##D     pred, fam, varb, id, root, data = redata)
##D summary(out6)
## End(Not run)
lout <- lm(y ~ z1 + z2 + I(z1^2) + I(z1*z2) + I(z2^2), data = ladata)
summary(lout)



