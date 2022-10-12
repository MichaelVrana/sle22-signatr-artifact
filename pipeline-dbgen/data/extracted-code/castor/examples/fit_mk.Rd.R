library(castor)


### Name: fit_mk
### Title: Fit a Markov (Mk) model for discrete trait evolution.
### Aliases: fit_mk
### Keywords: Mk model ancestral state reconstruction rerooting maximum
###   likelihood

### ** Examples
## Not run: 
##D # generate random tree
##D Ntips = 1000
##D tree  = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree
##D 
##D # create random transition matrix
##D Nstates = 5
##D Q = get_random_mk_transition_matrix(Nstates, rate_model="ER", max_rate=0.01)
##D cat(sprintf("Simulated ER transition rate=%g\n",Q[1,2]))
##D 
##D # simulate the trait's evolution
##D simulation = simulate_mk_model(tree, Q)
##D tip_states = simulation$tip_states
##D 
##D # fit Mk transition matrix
##D results = fit_mk(tree, Nstates, tip_states, rate_model="ER", Ntrials=2)
##D 
##D # print Mk model fitting summary
##D cat(sprintf("Mk model: log-likelihood=%g\n",results$loglikelihood))
##D cat(sprintf("Fitted ER transition rate=%g\n",results$transition_matrix[1,2]))
## End(Not run)


