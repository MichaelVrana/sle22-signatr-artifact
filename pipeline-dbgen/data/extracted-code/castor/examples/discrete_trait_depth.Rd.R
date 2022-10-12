library(castor)


### Name: discrete_trait_depth
### Title: Calculate phylogenetic depth of a discrete trait.
### Aliases: discrete_trait_depth
### Keywords: trait evolution

### ** Examples
## Not run: 
##D # generate a random tree
##D tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=1000)$tree
##D 
##D # simulate discrete trait evolution on the tree
##D # consider a trait with 3 discrete states
##D Q = get_random_mk_transition_matrix(Nstates=3, rate_model="ARD", max_rate=0.1)
##D tip_states = simulate_mk_model(tree, Q)$tip_states
##D 
##D # calculate phylogenetic conservatism of trait
##D results = discrete_trait_depth(tree, tip_states, count_singletons=FALSE, weighted=TRUE)
##D cat(sprintf("Mean depth = %g, std = %g\n",results$mean_depth,sqrt(results$var_depth)))
## End(Not run)


