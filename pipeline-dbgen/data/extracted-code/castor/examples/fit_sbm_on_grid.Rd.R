library(castor)


### Name: fit_sbm_on_grid
### Title: Fit a phylogeographic Spherical Brownian Motion model with
###   piecewise-linear diffusivity.
### Aliases: fit_sbm_on_grid
### Keywords: SBM model random fitting simulation

### ** Examples

## Not run: 
##D # generate a random tree, keeping extinct lineages
##D tree_params = list(birth_rate_factor=1, death_rate_factor=0.95)
##D tree = generate_random_tree(tree_params,max_tips=2000,coalescent=FALSE)$tree
##D 
##D # calculate max distance of any tip from the root
##D max_time = get_tree_span(tree)$max_distance
##D 
##D # simulate time-dependent SBM on the tree
##D # using a diffusivity that varies roughly exponentially with time
##D # In this example we measure distances in Earth radii
##D radius = 1
##D fine_time_grid = seq(from=0, to=max_time, length.out=10)
##D fine_D = 0.01 + 0.03*exp(-2*fine_time_grid/max_time)
##D simul = simulate_sbm(tree, 
##D                      radius     = radius, 
##D                      diffusivity= fine_D, 
##D                      time_grid  = fine_time_grid)
##D 
##D # fit time-dependent SBM on a time-grid of size 4
##D fit = fit_sbm_on_grid(tree,
##D             simul$tip_latitudes,
##D             simul$tip_longitudes,
##D             radius    = radius,
##D             time_grid = seq(from=0,to=max_time,length.out=4),
##D             Nthreads  = 3,  # use 3 CPUs
##D             Ntrials   = 30) # avoid local optima through multiple trials
##D     
##D # visually compare fitted & true params
##D plot(x      = fine_time_grid,
##D      y      = fine_D,
##D      type   = 'l',
##D      col    = 'black',
##D      xlab   = 'time',
##D      ylab   = 'D',
##D      ylim   = c(0,max(fine_D)))
##D lines(x     = fit$time_grid,
##D       y     = fit$diffusivity,
##D       type  = 'l',
##D       col   = 'blue')
## End(Not run)



