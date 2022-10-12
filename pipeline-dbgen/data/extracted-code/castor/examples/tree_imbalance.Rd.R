library(castor)


### Name: tree_imbalance
### Title: Calculate various imbalance statistics for a tree.
### Aliases: tree_imbalance

### ** Examples

# generate a random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),Ntips)$tree

# calculate Colless statistic
colless_index = tree_imbalance(tree, type="Colless")



