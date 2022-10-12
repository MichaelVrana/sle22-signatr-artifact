library(castor)


### Name: asr_max_parsimony
### Title: Maximum-parsimony ancestral state reconstruction.
### Aliases: asr_max_parsimony
### Keywords: maximum parsimony ancestral state reconstruction Sankoff's
###   algorithm

### ** Examples
## Not run: 
##D # generate random tree
##D Ntips = 10
##D tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree
##D 
##D # simulate a discrete trait
##D Nstates = 5
##D Q = get_random_mk_transition_matrix(Nstates, rate_model="ER")
##D tip_states = simulate_mk_model(tree, Q)$tip_states
##D 
##D # reconstruct node states via MPR
##D results = asr_max_parsimony(tree, tip_states, Nstates)
##D node_states = max.col(results$ancestral_likelihoods)
##D 
##D # print reconstructed node states
##D print(node_states)
## End(Not run)


