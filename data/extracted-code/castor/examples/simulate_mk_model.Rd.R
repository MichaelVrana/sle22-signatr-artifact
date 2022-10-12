library(castor)


### Name: simulate_mk_model
### Title: Simulate an Mk model for discrete trait evolution.
### Aliases: simulate_mk_model
### Keywords: Mk model random simulation

### ** Examples
## Not run: 
##D # generate a random tree
##D tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=1000)$tree
##D 
##D # simulate discrete trait evolution on the tree (5 states)
##D Nstates = 5
##D Q = get_random_mk_transition_matrix(Nstates, rate_model="ARD", max_rate=0.1)
##D tip_states = simulate_mk_model(tree, Q)$tip_states
##D 
##D # plot histogram of simulated tip states
##D barplot(table(tip_states)/length(tip_states), xlab="state")
## End(Not run)


