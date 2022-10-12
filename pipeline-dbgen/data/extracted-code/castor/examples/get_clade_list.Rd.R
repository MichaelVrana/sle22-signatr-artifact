library(castor)


### Name: get_clade_list
### Title: Get a representation of a tree as a table listing tips/nodes.
### Aliases: get_clade_list

### ** Examples

# generate a random bifurcating tree
tree = generate_random_tree(list(birth_rate_intercept=1),
                            max_tips=100)$tree

# get tree structure as clade list
# then convert into a similar format as would be
# returned by phybase::read.tree.nodes v1.4
results = get_clade_list(tree,postorder=TRUE,missing_value=-9)
nodematrix = cbind( results$clades, 
                    results$lengths, 
                    matrix(-9,nrow=nrow(results$clades),ncol=3))
phybaseformat = list(   nodes = nodematrix, 
                        names = tree$tip.label, 
                        root  = TRUE)



