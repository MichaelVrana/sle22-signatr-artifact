library(castor)


### Name: fit_sbm_const
### Title: Fit a phylogeographic Spherical Brownian Motion model.
### Aliases: fit_sbm_const
### Keywords: SBM model random fitting simulation

### ** Examples

## Not run: 
##D # generate a random tree
##D tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=500)$tree
##D 
##D # simulate SBM on the tree
##D D = 1e4
##D simulation = simulate_sbm(tree, radius=6371, diffusivity=D)
##D 
##D # fit SBM on the tree
##D fit = fit_sbm_const(tree,simulation$tip_latitudes,simulation$tip_longitudes,radius=6371)
##D cat(sprintf('True D=%g, fitted D=%g\n',D,fit$diffusivity))
## End(Not run)



