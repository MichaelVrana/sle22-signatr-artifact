library(castor)


### Name: asr_empirical_probabilities
### Title: Empirical ancestral state probabilities.
### Aliases: asr_empirical_probabilities
### Keywords: maximum parsimony ancestral state reconstruction Sankoff's
###   algorithm

### ** Examples

## Not run: 
##D # generate a random tree
##D Ntips = 100
##D tree  = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree
##D 
##D # create a random transition matrix
##D Nstates = 3
##D Q = get_random_mk_transition_matrix(Nstates, rate_model="ER", max_rate=0.01)
##D cat(sprintf("Simulated ER transition rate=%g\n",Q[1,2]))
##D 
##D # simulate the trait's evolution
##D simulation = simulate_mk_model(tree, Q)
##D tip_states = simulation$tip_states
##D 
##D # calculate empirical probabilities of tip states
##D asr_empirical_probabilities(tree, tip_states=tip_states, Nstates=Nstates)
## End(Not run)



