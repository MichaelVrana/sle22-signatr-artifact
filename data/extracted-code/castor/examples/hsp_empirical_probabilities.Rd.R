library(castor)


### Name: hsp_empirical_probabilities
### Title: Hidden state prediction via empirical probabilities.
### Aliases: hsp_empirical_probabilities
### Keywords: maximum parsimony ancestral state reconstruction Sankoff's
###   algorithm hidden state prediction

### ** Examples
## Not run: 
##D # generate random tree
##D Ntips = 100
##D tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree
##D 
##D # simulate a discrete trait
##D Nstates = 5
##D Q = get_random_mk_transition_matrix(Nstates, rate_model="ER", max_rate=0.1)
##D tip_states = simulate_mk_model(tree, Q)$tip_states
##D 
##D # print states of first 20 tips
##D print(tip_states[1:20])
##D 
##D # set half of the tips to unknown state
##D tip_states[sample.int(Ntips,size=as.integer(Ntips/2),replace=FALSE)] = NA
##D 
##D # reconstruct all tip states via MPR
##D likelihoods = hsp_empirical_probabilities(tree, tip_states, Nstates)$likelihoods
##D estimated_tip_states = max.col(likelihoods[1:Ntips,])
##D 
##D # print estimated states of first 20 tips
##D print(estimated_tip_states[1:20])
## End(Not run)


