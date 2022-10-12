library(castor)


### Name: fit_and_compare_sbm_const
### Title: Fit and compare Spherical Brownian Motion models for diffusive
###   geographic dispersal between two data sets.
### Aliases: fit_and_compare_sbm_const
### Keywords: SBM model

### ** Examples

## Not run: 
##D # simulate distinct SBM models on two random trees
##D radius = 6371   # Earth's radius
##D D1     = 1      # diffusivity on 1st tree
##D D2     = 3      # diffusivity on 2nd tree
##D tree1  = generate_random_tree(list(birth_rate_factor=1),max_tips=100)$tree
##D tree2  = generate_random_tree(list(birth_rate_factor=1),max_tips=100)$tree
##D sim1   = simulate_sbm(tree=tree1, radius=radius, diffusivity=D1)
##D sim2   = simulate_sbm(tree=tree2, radius=radius, diffusivity=D2)
##D tip_latitudes1  = sim1$tip_latitudes
##D tip_longitudes1 = sim1$tip_longitudes
##D tip_latitudes2  = sim2$tip_latitudes
##D tip_longitudes2 = sim2$tip_longitudes
##D 
##D # fit and compare SBM models between the two hypothetical data sets
##D fit = fit_and_compare_sbm_const(trees1          = tree1, 
##D                                 tip_latitudes1  = tip_latitudes1, 
##D                                 tip_longitudes1 = tip_longitudes1, 
##D                                 trees2          = tree2,
##D                                 tip_latitudes2  = tip_latitudes2, 
##D                                 tip_longitudes2 = tip_longitudes2, 
##D                                 radius          = radius,
##D                                 Nbootstraps     = 0,
##D                                 Nsignificance   = 100)
##D 
##D # print summary of results
##D cat(sprintf("Fitted D1 = %g, D2 = %g, significance of log-diff. = %g\n",
##D             fit$fit1$diffusivity, fit$fit2$diffusivity, fit$log_significance))
## End(Not run)



