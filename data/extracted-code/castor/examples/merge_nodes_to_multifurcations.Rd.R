library(castor)


### Name: merge_nodes_to_multifurcations
### Title: Merge specific nodes into multifurcations.
### Aliases: merge_nodes_to_multifurcations
### Keywords: multifurcations

### ** Examples

# generate a random tree
Ntips = 100
tree = generate_random_tree(list(birth_rate_intercept=1), max_tips=Ntips)$tree

# merge a few nodes with their parents,
# thus obtaining a multifurcating tree
nodes_to_merge = c(1,3,4)
new_tree = merge_nodes_to_multifurcations(tree, nodes_to_merge)$tree

# print summary of old and new tree
cat(sprintf("Old tree has %d nodes\n",tree$Nnode))
cat(sprintf("New tree has %d nodes\n",new_tree$Nnode))



