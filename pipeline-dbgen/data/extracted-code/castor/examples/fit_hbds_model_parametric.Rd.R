library(castor)


### Name: fit_hbds_model_parametric
### Title: Fit a parametric homogenous birth-death-sampling model to a
###   timetree.
### Aliases: fit_hbds_model_parametric
### Keywords: tree model birth-death-sampling model

### ** Examples

## Not run: 
##D # Generate a random tree with exponentially varying lambda & mu and constant psi
##D # assume that all sampled lineages are removed from the pool (i.e. kappa=0)
##D time_grid = seq(from=0, to=100, by=0.01)
##D root_age  = 5
##D tree = generate_tree_hbds(max_time  = root_age,
##D                         time_grid   = time_grid,
##D                         lambda      = 2*exp(0.1*time_grid),
##D                         mu          = 0.1*exp(0.09*time_grid),
##D                         psi         = 0.1,
##D                         kappa       = 0)$tree
##D cat(sprintf("Tree has %d tips\n",length(tree$tip.label)))
##D 
##D 
##D # Define a parametric HBDS model, with exponentially varying lambda & mu
##D # Assume that the sampling rate is constant but unknown
##D # The model thus has 5 parameters: lambda0, mu0, alpha, beta, psi
##D lambda_function = function(ages,params){
##D     return(params['lambda0']*exp(-params['alpha']*ages));
##D }
##D mu_function = function(ages,params){
##D     return(params['mu0']*exp(-params['beta']*ages));
##D }
##D psi_function = function(ages,params){
##D     return(rep(params['psi'],length(ages)))
##D }
##D 
##D # Define an age grid on which lambda_function & mu_function shall be evaluated
##D # Should be sufficiently fine to capture the variation in lambda & mu
##D age_grid = seq(from=0,to=root_age,by=0.01)
##D 
##D # Perform fitting
##D cat(sprintf("Fitting model to tree..\n"))
##D fit = fit_hbds_model_parametric(tree, 
##D                       root_age      = root_age,
##D                       param_values  = c(lambda0=NA, mu0=NA, alpha=NA, beta=NA, psi=NA),
##D                       param_guess   = c(1,1,0,0,0.5),
##D                       param_min     = c(0,0,-1,-1,0),
##D                       param_max     = c(10,10,1,1,10),
##D                       param_scale   = 1, # all params are in the order of 1
##D                       lambda        = lambda_function,
##D                       mu            = mu_function,
##D                       psi           = psi_function,
##D                       kappa         = 0,
##D                       age_grid      = age_grid,
##D                       Ntrials       = 4, # perform 4 fitting trials
##D                       Nthreads      = 2) # use 2 CPUs
##D if(!fit$success){
##D     cat(sprintf("ERROR: Fitting failed: %s\n",fit$error))
##D }else{
##D     cat(sprintf("Fitting succeeded:\nLoglikelihood=%g\n",fit$loglikelihood))
##D     # print fitted parameters
##D     print(fit$param_fitted)
##D }
## End(Not run)



