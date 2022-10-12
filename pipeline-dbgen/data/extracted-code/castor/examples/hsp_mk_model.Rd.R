library(castor)


### Name: hsp_mk_model
### Title: Hidden state prediction with Mk models and rerooting
### Aliases: hsp_mk_model
### Keywords: Mk model ancestral state reconstruction rerooting maximum
###   likelihood hidden state prediction

### ** Examples
## Not run: 
##D # generate random tree
##D Ntips = 1000
##D tree  = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree
##D 
##D # simulate a discrete trait
##D Nstates = 5
##D Q = get_random_mk_transition_matrix(Nstates, rate_model="ER", max_rate=0.01)
##D tip_states = simulate_mk_model(tree, Q)$tip_states
##D cat(sprintf("Simulated ER transition rate=%g\n",Q[1,2]))
##D 
##D # print states for first 20 tips
##D print(tip_states[1:20])
##D 
##D # set half of the tips to unknown state
##D # chose tips randomly, regardless of their state (no biases)
##D tip_states[sample.int(Ntips,size=as.integer(Ntips/2),replace=FALSE)] = NA
##D 
##D # reconstruct all tip states via Mk model max-likelihood
##D results = hsp_mk_model(tree, tip_states, Nstates, rate_model="ER", Ntrials=2, Nthreads=2)
##D estimated_tip_states = max.col(results$likelihoods[1:Ntips,])
##D 
##D # print Mk model fitting summary
##D cat(sprintf("Mk model: log-likelihood=%g\n",results$loglikelihood))
##D cat(sprintf("Universal (ER) transition rate=%g\n",results$transition_matrix[1,2]))
##D 
##D # print estimated states for first 20 tips
##D print(estimated_tip_states[1:20])
## End(Not run)


