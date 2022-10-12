library(castor)


### Name: fit_musse
### Title: Fit a discrete-state-dependent diversification model via
###   maximum-likelihood.
### Aliases: fit_musse
### Keywords: random tree model MuSSE BiSSE HiSSE

### ** Examples

# EXAMPLE 1: BiSSE model
# - - - - - - - - - - - - - -
# Choose random BiSSE model parameters
Nstates = 2
Q = get_random_mk_transition_matrix(Nstates, rate_model="ARD", max_rate=0.1)
parameters = list(birth_rates       = runif(Nstates,5,10),
                  death_rates       = runif(Nstates,0,5),
                  transition_matrix = Q)
rarefaction = 0.5 # randomly omit half of the tips

# Simulate a tree under the BiSSE model
simulation = simulate_musse(Nstates, 
                            parameters         = parameters, 
                            max_tips           = 1000,
                            sampling_fractions = rarefaction)
tree       = simulation$tree
tip_states = simulation$tip_states

## Not run: 
##D # fit BiSSE model to tree & tip data
##D fit = fit_musse(tree,
##D                 Nstates            = Nstates,
##D                 tip_pstates        = tip_states,
##D                 sampling_fractions = rarefaction)
##D if(!fit$success){
##D   cat(sprintf("ERROR: Fitting failed"))
##D }else{
##D   # compare fitted birth rates to true values
##D   errors = (fit$parameters$birth_rates - parameters$birth_rates)
##D   relative_errors = errors/parameters$birth_rates
##D   cat(sprintf("BiSSE relative birth-rate errors:\n"))
##D   print(relative_errors)
##D }
## End(Not run)


# EXAMPLE 2: HiSSE model, with bootstrapping
# - - - - - - - - - - - - - -
# Choose random HiSSE model parameters
Nstates  = 4
NPstates = 2
Q = get_random_mk_transition_matrix(Nstates, rate_model="ARD", max_rate=0.1)
rarefaction = 0.5 # randomly omit half of the tips
parameters = list(birth_rates       = runif(Nstates,5,10),
                  death_rates       = runif(Nstates,0,5),
                  transition_matrix = Q)
                  
# reveal the state of 30% & 60% of tips (in state 1 & 2, respectively)
reveal_fractions = c(0.3,0.6)

# use proxy map corresponding to Beaulieu and O'Meara (2016)
proxy_map = c(1,2,1,2)

# Simulate a tree under the HiSSE model
simulation = simulate_musse(Nstates, 
                            NPstates            = NPstates,
                            proxy_map           = proxy_map,
                            parameters          = parameters, 
                            max_tips            = 1000,
                            sampling_fractions  = rarefaction,
                            reveal_fractions    = reveal_fractions)
tree       = simulation$tree
tip_states = simulation$tip_proxy_states

## Not run: 
##D # fit HiSSE model to tree & tip data
##D # run multiple trials to ensure global optimum
##D # also estimate confidence intervals via bootstrapping
##D fit = fit_musse(tree,
##D                 Nstates            = Nstates,
##D                 NPstates           = NPstates,
##D                 proxy_map          = proxy_map,
##D                 tip_pstates        = tip_states,
##D                 sampling_fractions = rarefaction,
##D                 reveal_fractions   = reveal_fractions,
##D                 Ntrials            = 5,
##D                 Nbootstraps        = 10,
##D                 max_model_runtime  = 0.1)
##D if(!fit$success){
##D   cat(sprintf("ERROR: Fitting failed"))
##D }else{
##D   # compare fitted birth rates to true values
##D   errors = (fit$parameters$birth_rates - parameters$birth_rates)
##D   relative_errors = errors/parameters$birth_rates
##D   cat(sprintf("HiSSE relative birth-rate errors:\n"))
##D   print(relative_errors)
##D   
##D   # print 95%-confidence interval for first birth rate
##D   cat(sprintf("CI95 for lambda1: %g-%g",
##D               fit$CI95lower$birth_rates[1],
##D               fit$CI95upper$birth_rates[1]))
##D }
## End(Not run)



