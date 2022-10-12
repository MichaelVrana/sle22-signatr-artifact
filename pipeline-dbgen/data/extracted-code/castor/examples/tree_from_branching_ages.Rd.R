library(castor)


### Name: tree_from_branching_ages
### Title: Generate a random timetree with specific branching ages.
### Aliases: tree_from_branching_ages
### Keywords: random tree model simulation

### ** Examples

Nnodes              = 100
branching_intervals = rexp(n=Nnodes, rate=1)
branching_ages      = cumsum(branching_intervals)
tree                = castor::tree_from_branching_ages(branching_ages)$tree



