library(castor)


### Name: loglikelihood_hbd
### Title: Galculate the log-likelihood of a homogenous birth-death model.
### Aliases: loglikelihood_hbd
### Keywords: tree model homogenous birth-death model

### ** Examples

# generate a random tree with constant rates
Ntips  = 100
params = list(birth_rate_factor=1, death_rate_factor=0.2, rarefaction=0.5)
tree   = generate_random_tree(params, max_tips=Ntips, coalescent=TRUE)$tree

# get the loglikelihood for an HBD model with the same parameters that generated the tree
# in particular, assuming time-independent speciation & extinction rates
LL = loglikelihood_hbd( tree, 
                        rho0      = params$rarefaction, 
                        age_grid  = NULL, # assume time-independent rates
                        lambda    = params$birth_rate_factor,
                        mu        = params$death_rate_factor)
if(LL$success){
  cat(sprintf("Loglikelihood for constant-rates model = %g\n",LL$loglikelihood))
}

# get the likelihood for a model with exponentially decreasing (in forward time) lambda & mu
beta      = 0.01 # exponential decay rate of lambda over time
age_grid  = seq(from=0, to=100, by=0.1) # choose a sufficiently fine age grid
lambda    = 1*exp(beta*age_grid) # define lambda on the age grid
mu        = 0.2*lambda # assume similarly shaped but smaller mu
LL = loglikelihood_hbd( tree, 
                        rho0      = params$rarefaction, 
                        age_grid  = age_grid,
                        lambda    = lambda,
                        mu        = mu)
if(LL$success){
  cat(sprintf("Loglikelihood for exponential-rates model = %g\n",LL$loglikelihood))
}



