library(castor)


### Name: shift_clade_times
### Title: Shift the time of specific nodes & tips.
### Aliases: shift_clade_times
### Keywords: phylogenetic distance dating

### ** Examples

# generate a random tree, include node names
tree = generate_random_tree(list(birth_rate_intercept=1),
                            max_tips=20,
                            node_basename="node.")$tree

# shift a few nodes backward in time,
# changing as few of the remaining node timings as possible
clades_to_shift = c("node.2",   "node.5",   "node.6")
time_shifts     = c(-0.5,       -0.2,       -0.3)
new_tree        = shift_clade_times(tree, 
                                    clades_to_shift, 
                                    time_shifts,
                                    shift_descendants=FALSE,
                                    negative_edge_lengths="move_parent")$tree



