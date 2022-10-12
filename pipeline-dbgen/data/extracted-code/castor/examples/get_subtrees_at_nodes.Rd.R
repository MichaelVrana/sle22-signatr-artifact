library(castor)


### Name: get_subtrees_at_nodes
### Title: Extract subtrees descending from specific nodes.
### Aliases: get_subtrees_at_nodes
### Keywords: pruning subtree

### ** Examples

# generate a random tree
Ntips = 1000
tree = generate_random_tree(list(birth_rate_intercept=1),Ntips)$tree

# extract subtrees descending from random nodes
nodes = sample.int(tree$Nnode,size=10)
subtrees = get_subtrees_at_nodes(tree, nodes)$subtrees

# print summaries of extracted subtrees
for(n in length(nodes)){
  cat(sprintf("Subtree at %d-th node has %d tips\n",nodes[n],length(subtrees[[n]]$tip.label)))
}



