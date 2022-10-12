library(castor)


### Name: fit_sbm_parametric
### Title: Fit a time-dependent phylogeographic Spherical Brownian Motion
###   model.
### Aliases: fit_sbm_parametric
### Keywords: SBM model random fitting simulation

### ** Examples

## Not run: 
##D # generate a random tree, keeping extinct lineages
##D tree_params = list(birth_rate_factor=1, death_rate_factor=0.95)
##D tree = generate_random_tree(tree_params,max_tips=1000,coalescent=FALSE)$tree
##D 
##D # calculate max distance of any tip from the root
##D max_time = get_tree_span(tree)$max_distance
##D 
##D # simulate time-dependent SBM on the tree
##D # we assume that diffusivity varies linearly with time
##D # in this example we measure distances in Earth radii
##D radius = 1
##D diffusivity_functor = function(times, params){
##D 	return(params[1] + (times/max_time)*(params[2]-params[1]))
##D }
##D true_params = c(1, 2)
##D time_grid   = seq(0,max_time,length.out=2)
##D simulation  = simulate_sbm(tree,
##D                       radius      = radius, 
##D                       diffusivity = diffusivity_functor(time_grid,true_params), 
##D                       time_grid   = time_grid)
##D 
##D # fit time-independent SBM to get a rough estimate
##D fit_const = fit_sbm_const(tree,simulation$tip_latitudes,simulation$tip_longitudes,radius=radius)
##D 
##D # fit time-dependent SBM, i.e. fit the 2 parameters of the linear form
##D fit = fit_sbm_parametric(tree,
##D             simulation$tip_latitudes,
##D             simulation$tip_longitudes,
##D             radius = radius,
##D             param_values = c(NA,NA),
##D             param_guess = c(fit_const$diffusivity,fit_const$diffusivity),
##D             diffusivity = diffusivity_functor,
##D             time_grid = time_grid,
##D             Ntrials = 10)
##D     
##D # compare fitted & true params
##D print(true_params)
##D print(fit$param_fitted)
## End(Not run)



