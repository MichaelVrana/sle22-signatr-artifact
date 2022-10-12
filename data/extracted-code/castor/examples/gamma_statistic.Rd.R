library(castor)


### Name: gamma_statistic
### Title: Calculate the gamma-statistic of a tree.
### Aliases: gamma_statistic

### ** Examples

# generate a random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1),Ntips)$tree

# calculate & print gamma statistic
gammastat = gamma_statistic(tree)
cat(sprintf("Tree has gamma-statistic %g\n",gammastat))



