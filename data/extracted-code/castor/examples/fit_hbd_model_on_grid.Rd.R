library(castor)


### Name: fit_hbd_model_on_grid
### Title: Fit a homogenous birth-death model on a discrete time grid.
### Aliases: fit_hbd_model_on_grid
### Keywords: tree model birth-death model skyline model

### ** Examples

## Not run: 
##D # Generate a random tree with exponentially varying lambda & mu
##D Ntips     = 10000
##D rho       = 0.5 # sampling fraction
##D time_grid = seq(from=0, to=100, by=0.01)
##D lambdas   = 2*exp(0.1*time_grid)
##D mus       = 1.5*exp(0.09*time_grid)
##D sim       = generate_random_tree( parameters  = list(rarefaction=rho), 
##D                                   max_tips    = Ntips/rho,
##D                                   coalescent  = TRUE,
##D                                   added_rates_times     = time_grid,
##D                                   added_birth_rates_pc  = lambdas,
##D                                   added_death_rates_pc  = mus)
##D tree = sim$tree
##D root_age = castor::get_tree_span(tree)$max_distance
##D cat(sprintf("Tree has %d tips, spans %g Myr\n",length(tree$tip.label),root_age))
##D 
##D 
##D # Fit mu on grid
##D # Assume that lambda & rho are known
##D Ngrid     = 5
##D age_grid  = seq(from=0,to=root_age,length.out=Ngrid)
##D fit = fit_hbd_model_on_grid(tree, 
##D           age_grid    = age_grid,
##D           max_mu      = 100,
##D           fixed_lambda= approx(x=time_grid,y=lambdas,xout=sim$final_time-age_grid)$y,
##D           fixed_rho0   = rho,
##D           condition   = "crown",
##D           Ntrials     = 10,	# perform 10 fitting trials
##D           Nthreads    = 2,	# use two CPUs
##D           max_model_runtime = 1) 	# limit model evaluation to 1 second
##D if(!fit$success){
##D   cat(sprintf("ERROR: Fitting failed: %s\n",fit$error))
##D }else{
##D   cat(sprintf("Fitting succeeded:\nLoglikelihood=%g\n",fit$loglikelihood))
##D   
##D   # plot fitted & true mu
##D   plot( x     = fit$age_grid,
##D         y     = fit$fitted_mu,
##D         main  = 'Fitted & true mu',
##D         xlab  = 'age',
##D         ylab  = 'mu',
##D         type  = 'b',
##D         col   = 'red',
##D         xlim  = c(root_age,0))
##D   lines(x     = sim$final_time-time_grid,
##D         y     = mus,
##D         type  = 'l',
##D         col   = 'blue');
##D         
##D   # get fitted mu as a function of age
##D   mu_fun = approxfun(x=fit$age_grid, y=fit$fitted_mu)
##D }
## End(Not run)



