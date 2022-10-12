library(castor)


### Name: fit_hbd_psr_on_grid
### Title: Fit pulled speciation rates of birth-death models on a time
###   grid.
### Aliases: fit_hbd_psr_on_grid
### Keywords: tree model birth-death model pulled speciation rate

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
##D # Fit PSR on grid
##D oldest_age=root_age/2 # only consider recent times when fitting
##D Ngrid     = 10
##D age_grid  = seq(from=0,to=oldest_age,length.out=Ngrid)
##D fit = fit_hbd_psr_on_grid(tree, 
##D           oldest_age  = oldest_age,
##D           age_grid    = age_grid,
##D           min_PSR     = 0,
##D           max_PSR     = +100,
##D           condition   = "crown",
##D           Ntrials     = 10,
##D           Nthreads    = 4,
##D           max_model_runtime = 1) 	# limit model evaluation to 1 second
##D if(!fit$success){
##D   cat(sprintf("ERROR: Fitting failed: %s\n",fit$error))
##D }else{
##D   cat(sprintf("Fitting succeeded:\nLoglikelihood=%g\n",fit$loglikelihood))
##D   # plot fitted PSR
##D   plot( x     = fit$age_grid,
##D         y     = fit$fitted_PSR,
##D         main  = 'Fitted PSR',
##D         xlab  = 'age',
##D         ylab  = 'PSR',
##D         type  = 'b',
##D         xlim  = c(root_age,0)) 
##D         
##D  # plot deterministic LTT of fitted model
##D   plot( x     = fit$age_grid,
##D         y     = fit$fitted_LTT,
##D         main  = 'Fitted dLTT',
##D         xlab  = 'age',
##D         ylab  = 'lineages',
##D         type  = 'b',
##D         log   = 'y',
##D         xlim  = c(root_age,0)) 
##D 
##D   # get fitted PSR as a function of age
##D   PSR_fun = approxfun(x=fit$age_grid, y=fit$fitted_PSR)
##D }
## End(Not run)



