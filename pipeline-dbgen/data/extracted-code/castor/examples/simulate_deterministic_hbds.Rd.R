library(castor)


### Name: simulate_deterministic_hbds
### Title: Simulate a deterministic homogenous birth-death-sampling model.
### Aliases: simulate_deterministic_hbds
### Keywords: tree model simulation birth-death model

### ** Examples

# define an HBDS model with exponentially decreasing speciation/extinction rates
# and constant Poissonian sampling rate psi
oldest_age= 10
age_grid  = seq(from=0,to=oldest_age,by=0.1) # choose a sufficiently fine age grid
lambda    = 1*exp(0.01*age_grid) # define lambda on the age grid
mu        = 0.2*lambda # assume similarly shaped but smaller mu

# simulate deterministic HBD model
# scale LTT such that it is 100 at age 1
simulation = simulate_deterministic_hbds(age_grid   = age_grid,
                                         lambda     = lambda,
                                         mu         = mu,
                                         psi        = 0.1,
                                         age0       = 1,
                                         LTT0       = 100)
# plot deterministic LTT
plot( x = simulation$ages, y = simulation$LTT, type='l',
      main='dLTT', xlab='age', ylab='lineages', xlim=c(oldest_age,0))



