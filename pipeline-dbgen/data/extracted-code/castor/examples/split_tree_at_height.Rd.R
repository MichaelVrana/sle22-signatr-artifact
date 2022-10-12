library(castor)


### Name: split_tree_at_height
### Title: Split a tree into subtrees at a specific height.
### Aliases: split_tree_at_height
### Keywords: pruning

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1),
                            max_tips=100)$tree

# split tree halfway towards the root
root_age = get_tree_span(tree)$max_distance
splitting = split_tree_at_height(tree, height=0.5*root_age)

# print number of subtrees obtained
cat(sprintf("Obtained %d subtrees\n",splitting$Nsubtrees))



