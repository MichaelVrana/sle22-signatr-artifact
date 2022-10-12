library(castor)


### Name: asr_mk_model
### Title: Ancestral state reconstruction with Mk models and rerooting
### Aliases: asr_mk_model
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
##D cat(sprintf("Simulated states for last 20 nodes:\n"))
##D print(tail(simulation$node_states,20))
##D 
##D # reconstruct node states from simulated tip states
##D # at each node, pick state with highest marginal likelihood
##D results = asr_mk_model(tree, tip_states, Nstates, rate_model="ER", Ntrials=2)
##D node_states = max.col(results$ancestral_likelihoods)
##D 
##D # print Mk model fitting summary
##D cat(sprintf("Mk model: log-likelihood=%g\n",results$loglikelihood))
##D cat(sprintf("Fitted ER transition rate=%g\n",results$transition_matrix[1,2]))
##D 
##D # print reconstructed node states for last 20 nodes
##D print(tail(node_states,20))
## End(Not run)


