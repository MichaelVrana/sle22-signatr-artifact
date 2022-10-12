library(castor)


### Name: fit_hbd_pdr_on_best_grid_size
### Title: Fit pulled diversification rates of birth-death models on a time
###   grid with optimal size.
### Aliases: fit_hbd_pdr_on_best_grid_size
### Keywords: tree model birth-death model pulled diversification rate

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
##D # Fit PDR on grid, with the grid size chosen automatically between 1 and 5
##D fit = fit_hbd_pdr_on_best_grid_size(tree, 
##D                                     max_PDR           = 100,
##D                                     grid_sizes        = c(1:5),
##D                                     exhaustive        = FALSE,
##D                                     uniform_grid      = FALSE,
##D                                     Ntrials           = 10,
##D                                     Nthreads          = 4,
##D                                     verbose           = TRUE,
##D                                     max_model_runtime = 1)
##D if(!fit$success){
##D   cat(sprintf("ERROR: Fitting failed: %s\n",fit$error))
##D }else{
##D   best_fit = fit$best_fit
##D   cat(sprintf("Fitting succeeded:\nBest grid size=%d\n",length(best_fit$age_grid)))
##D   # plot fitted PDR
##D   plot( x     = best_fit$age_grid,
##D         y     = best_fit$fitted_PDR,
##D         main  = 'Fitted PDR',
##D         xlab  = 'age',
##D         ylab  = 'PDR',
##D         type  = 'b',
##D         xlim  = c(root_age,0))         
##D   # get fitted PDR as a function of age
##D   PDR_fun = approxfun(x=best_fit$age_grid, y=best_fit$fitted_PDR)
##D }
## End(Not run)



