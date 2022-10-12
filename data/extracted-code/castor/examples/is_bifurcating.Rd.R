library(castor)


### Name: is_bifurcating
### Title: Determine if a tree is bifurcating.
### Aliases: is_bifurcating
### Keywords: bifurcation

### ** Examples

# generate random tree
Ntips = 10
tree  = generate_random_tree(list(birth_rate_intercept=1),max_tips=Ntips)$tree

# check if the tree is bifurcating (as expected)
is_bifurcating(tree)



