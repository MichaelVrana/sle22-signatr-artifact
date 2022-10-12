library(castor)


### Name: hsp_max_parsimony
### Title: Hidden state prediction via maximum parsimony.
### Aliases: hsp_max_parsimony
### Keywords: maximum parsimony ancestral state reconstruction Sankoff's
###   algorithm hidden state prediction

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
##D # print tip states
##D print(tip_states)
##D 
##D # set half of the tips to unknown state
##D tip_states[sample.int(Ntips,size=as.integer(Ntips/2),replace=FALSE)] = NA
##D 
##D # reconstruct all tip states via MPR
##D likelihoods = hsp_max_parsimony(tree, tip_states, Nstates)$likelihoods
##D estimated_tip_states = max.col(likelihoods[1:Ntips,])
##D 
##D # print estimated tip states
##D print(estimated_tip_states)
## End(Not run)


