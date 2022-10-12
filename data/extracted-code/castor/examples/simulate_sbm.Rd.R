library(castor)


### Name: simulate_sbm
### Title: Simulate Spherical Brownian Motion on a tree.
### Aliases: simulate_sbm
### Keywords: SBM model random simulation

### ** Examples

## Not run: 
##D # generate a random tree
##D tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=100)$tree
##D 
##D # simulate SBM on the tree
##D simulation = simulate_sbm(tree, radius=6371, diffusivity=1e4,
##D                           root_latitude=0, root_longitude=0)
##D 
##D # plot latitudes and longitudes of the tips
##D plot(simulation$tip_latitudes,simulation$tip_longitudes)
## End(Not run)



