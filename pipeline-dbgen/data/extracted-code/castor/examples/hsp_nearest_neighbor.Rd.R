library(castor)


### Name: hsp_nearest_neighbor
### Title: Hidden state prediction based on nearest neighbor.
### Aliases: hsp_nearest_neighbor
### Keywords: hidden state prediction

### ** Examples
## Not run: 
##D # generate random tree
##D Ntips = 20
##D tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree
##D 
##D # simulate a binary trait
##D Q = get_random_mk_transition_matrix(2, rate_model="ER")
##D tip_states = simulate_mk_model(tree, Q)$tip_states
##D 
##D # print tip states
##D print(tip_states)
##D 
##D # set half of the tips to unknown state
##D tip_states[sample.int(Ntips,size=as.integer(Ntips/2),replace=FALSE)] = NA
##D 
##D # reconstruct all tip states via nearest neighbor
##D predicted_states = hsp_nearest_neighbor(tree, tip_states)$states
##D 
##D # print predicted tip states
##D print(predicted_states)
## End(Not run)


