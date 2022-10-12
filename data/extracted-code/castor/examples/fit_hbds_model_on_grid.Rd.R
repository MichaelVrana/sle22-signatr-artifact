library(castor)


### Name: fit_hbds_model_on_grid
### Title: Fit a homogenous birth-death-sampling model on a discrete time
###   grid.
### Aliases: fit_hbds_model_on_grid
### Keywords: tree model birth-death-sampling model skyline model

### ** Examples

## Not run: 
##D # define lambda & mu & psi as functions of time
##D # Assuming an exponentially varying lambda & mu, and a constant psi
##D time2lambda = function(times){ 2*exp(0.1*times) }
##D time2mu     = function(times){ 0.1*exp(0.09*times) }
##D time2psi    = function(times){ rep(0.2, times=length(times)) }
##D 
##D # define concentrated sampling attempts
##D CSA_times   = c(3,4)
##D CSA_probs   = c(0.1, 0.2)
##D 
##D # generate random tree based on lambda, mu & psi
##D # assume that all sampled lineages are removed from the pool (i.e. kappa=0)
##D time_grid = seq(from=0, to=100, by=0.01)
##D simul = generate_tree_hbds( max_time    = 5,
##D                             time_grid   = time_grid,
##D                             lambda      = time2lambda(time_grid),
##D                             mu          = time2mu(time_grid),
##D                             psi         = time2psi(time_grid),
##D                             kappa       = 0,
##D                             CSA_times   = CSA_times,
##D                             CSA_probs   = CSA_probs,
##D                             CSA_kappas  = 0)
##D tree     = simul$tree
##D root_age = simul$root_age
##D cat(sprintf("Tree has %d tips\n",length(tree$tip.label)))
##D 
##D # Define an age grid on which lambda_function & mu_function shall be fitted
##D fit_age_grid = seq(from=0,to=root_age,length.out=3)
##D 
##D # Fit an HBDS model on a grid
##D # Assume that psi is known and that sampled lineages are removed from the pool
##D # Hence, we only fit lambda & mu & CSA_probs
##D cat(sprintf("Fitting model to tree..\n"))
##D fit = fit_hbds_model_on_grid(tree, 
##D                              root_age           = root_age,
##D                              age_grid           = fit_age_grid,
##D                              CSA_ages           = rev(simul$final_time - CSA_times),
##D                              fixed_psi          = time2psi(simul$final_time-fit_age_grid),
##D                              fixed_kappa        = 0,
##D                              fixed_CSA_kappas   = 0,
##D                              Ntrials            = 4,
##D                              Nthreads           = 4,
##D                              Nbootstraps        = 0,
##D                              verbose            = TRUE,
##D                              verbose_prefix     = "  ")
##D if(!fit$success){
##D     cat(sprintf("ERROR: Fitting failed: %s\n",fit$error))
##D }else{
##D     # compare fitted lambda to true lambda
##D     plot(x=fit$age_grid, 
##D          y=fit$param_fitted$lambda, 
##D          type='l', 
##D          col='#000000', 
##D          xlim=c(root_age,0),
##D          xlab='age', 
##D          ylab='lambda')
##D     lines(x=simul$final_time-time_grid, 
##D           y=time2lambda(time_grid), 
##D           type='l', 
##D           col='#0000AA')
##D }
##D 
##D 
##D # compare true and fitted model in terms of their LTTs
##D LTT      = castor::count_lineages_through_time(tree, Ntimes=100, include_slopes=TRUE)
##D LTT$ages = root_age - LTT$times
##D 
##D cat(sprintf("Simulating deterministic HBDS (true model)..\n"))
##D age0 = 0.5 # reference age at which to equate LTTs
##D LTT0 = approx(x=LTT$ages, y=LTT$lineages, xout=age0)$y # tree LTT at age0
##D fsim = simulate_deterministic_hbds( age_grid        = fit$age_grid,
##D                                     lambda          = fit$param_fitted$lambda,
##D                                     mu              = fit$param_fitted$mu,
##D                                     psi             = fit$param_fitted$psi,
##D                                     kappa           = fit$param_fitted$kappa,
##D                                     CSA_ages        = fit$CSA_ages,
##D                                     CSA_probs       = fit$param_fitted$CSA_probs,
##D                                     CSA_kappas      = fit$param_fitted$CSA_kappas,
##D                                     requested_ages  = seq(0,root_age,length.out=200),
##D                                     age0            = age0,
##D                                     LTT0            = LTT0,
##D                                     splines_degree  = 1)
##D if(!fsim$success){
##D     cat(sprintf("ERROR: Could not simulate fitted model: %s\n",fsim$error))
##D     stop()
##D }
##D plot(x=LTT$ages, y=LTT$lineages, type='l', col='#0000AA', lwd=2, xlim=c(root_age,0))
##D lines(x=fsim$ages, y=fsim$LTT, type='l', col='#000000', lwd=2)
## End(Not run)



