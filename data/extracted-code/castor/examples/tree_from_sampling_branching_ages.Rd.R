library(castor)


### Name: tree_from_sampling_branching_ages
### Title: Generate a random timetree with specific tip/sampling and
###   node/branching ages.
### Aliases: tree_from_sampling_branching_ages
### Keywords: random tree model simulation

### ** Examples

sampling_ages   = c(0, 0.1, 0.15, 0.25, 0.9, 1.9, 3)
branching_ages  = c(0.3, 0.35, 0.4, 1.1, 2.5, 3.5)
tree = tree_from_sampling_branching_ages(sampling_ages, branching_ages)$tree



