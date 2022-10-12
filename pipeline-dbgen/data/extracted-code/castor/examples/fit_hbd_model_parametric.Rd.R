library(castor)


### Name: fit_hbd_model_parametric
### Title: Fit a parametric homogenous birth-death model to a timetree.
### Aliases: fit_hbd_model_parametric
### Keywords: tree model birth-death model

### ** Examples

## Not run: 
##D # Generate a random tree with exponentially varying lambda & mu
##D Ntips     = 10000
##D rho       = 0.5 # sampling fraction
##D time_grid = seq(from=0, to=100, by=0.01)
##D lambdas   = 2*exp(0.1*time_grid)
##D mus       = 1.5*exp(0.09*time_grid)
##D tree      = generate_random_tree( parameters  = list(rarefaction=rho), 
##D                                   max_tips    = Ntips/rho,
##D                                   coalescent  = TRUE,
##D                                   added_rates_times     = time_grid,
##D                                   added_birth_rates_pc  = lambdas,
##D                                   added_death_rates_pc  = mus)$tree
##D root_age = castor::get_tree_span(tree)$max_distance
##D cat(sprintf("Tree has %d tips, spans %g Myr\n",length(tree$tip.label),root_age))
##D 
##D # Define a parametric HBD model, with exponentially varying lambda & mu
##D # Assume that the sampling fraction is known
##D # The model thus has 4 parameters: lambda0, mu0, alpha, beta
##D lambda_function = function(ages,params){
##D 	return(params['lambda0']*exp(-params['alpha']*ages));
##D }
##D mu_function = function(ages,params){
##D 	return(params['mu0']*exp(-params['beta']*ages));
##D }
##D rho_function = function(params){
##D 	return(rho) # rho does not depend on any of the parameters
##D }
##D 
##D # Define an age grid on which lambda_function & mu_function shall be evaluated
##D # Should be sufficiently fine to capture the variation in lambda & mu
##D age_grid = seq(from=0,to=100,by=0.01)
##D 
##D # Perform fitting
##D # Lets suppose extinction rates are already known
##D cat(sprintf("Fitting model to tree..\n"))
##D fit = fit_hbd_model_parametric(	tree, 
##D                       param_values  = c(lambda0=NA, mu0=3, alpha=NA, beta=-0.09),
##D                       param_guess   = c(1,1,0,0),
##D                       param_min     = c(0,0,-1,-1),
##D                       param_max     = c(10,10,1,1),
##D                       param_scale   = 1, # all params are in the order of 1
##D                       lambda        = lambda_function,
##D                       mu            = mu_function,
##D                       rho0          = rho_function,
##D                       age_grid      = age_grid,
##D                       Ntrials       = 10,    # perform 10 fitting trials
##D                       Nthreads      = 2,     # use 2 CPUs
##D                       max_model_runtime = 1, # limit model evaluation to 1 second
##D                       fit_control       = list(rel.tol=1e-6))
##D if(!fit$success){
##D 	cat(sprintf("ERROR: Fitting failed: %s\n",fit$error))
##D }else{
##D 	cat(sprintf("Fitting succeeded:\nLoglikelihood=%g\n",fit$loglikelihood))
##D 	print(fit)
##D }
## End(Not run)



