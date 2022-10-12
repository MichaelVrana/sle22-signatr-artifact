library(castor)


### Name: fit_hbd_pdr_parametric
### Title: Fit parameterized pulled diversification rates of birth-death
###   models.
### Aliases: fit_hbd_pdr_parametric
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
##D # Define a parametric HBD congruence class, with exponentially varying PDR
##D # The model thus has 3 parameters
##D PDR_function = function(ages,params){
##D 	return(params['A']*exp(-params['B']*ages));
##D }
##D rholambda0_function = function(params){
##D 	return(params['rholambda0'])
##D }
##D 
##D # Define an age grid on which lambda_function & mu_function shall be evaluated
##D # Should be sufficiently fine to capture the variation in the PDR
##D age_grid = seq(from=0,to=100,by=0.01)
##D 
##D # Perform fitting
##D # Lets suppose extinction rates are already known
##D cat(sprintf("Fitting class to tree..\n"))
##D fit = fit_hbd_pdr_parametric(	tree, 
##D                       param_values  = c(A=NA, B=NA, rholambda0=NA),
##D                       param_guess   = c(1,0,1),
##D                       param_min     = c(-10,-10,0),
##D                       param_max     = c(10,10,10),
##D                       param_scale   = 1, # all params are in the order of 1
##D                       PDR           = PDR_function,
##D                       rholambda0    = rholambda0_function,
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



