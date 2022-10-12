library(castor)


### Name: count_lineages_through_time
### Title: Count number of lineages through time (LTT).
### Aliases: count_lineages_through_time
### Keywords: lineages through time

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1), max_tips=1000)$tree

# calculate classical LTT curve
results = count_lineages_through_time(tree, Ntimes=100)

# plot classical LTT curve
plot(results$times, results$lineages, type="l", xlab="time", ylab="# clades")



