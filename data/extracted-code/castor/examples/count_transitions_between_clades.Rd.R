library(castor)


### Name: count_transitions_between_clades
### Title: Count the number of state transitions between tips or nodes.
### Aliases: count_transitions_between_clades
### Keywords: Mk model

### ** Examples

# generate a random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),Ntips)$tree

# pick 3 random pairs of tips or nodes
Npairs = 3
A = sample.int(n=(Ntips+tree$Nnode), size=Npairs, replace=FALSE)
B = sample.int(n=(Ntips+tree$Nnode), size=Npairs, replace=FALSE)

# assign a random state to each tip & node in the tree
# consider a binary trait
states = sample.int(n=2, size=Ntips+tree$Nnode, replace=TRUE)

# calculate number of transitions for each tip pair
Ntransitions = count_transitions_between_clades(tree, A, B, states=states)



