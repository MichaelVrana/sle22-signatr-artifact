library(castor)


### Name: find_farthest_tip_pair
### Title: Find the two most distant tips in a tree.
### Aliases: find_farthest_tip_pair

### ** Examples

# generate a random tree
Ntips = 1000
parameters = list(birth_rate_intercept=1,death_rate_intercept=0.9)
tree = generate_random_tree(parameters,Ntips,coalescent=FALSE)$tree

# find farthest pair of tips
results = find_farthest_tip_pair(tree)

# print results
cat(sprintf("Tip %d and %d have distance %g\n",
            results$tip1,results$tip2,results$distance))



