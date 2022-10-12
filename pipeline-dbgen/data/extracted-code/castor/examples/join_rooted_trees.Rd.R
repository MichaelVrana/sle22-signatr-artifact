library(castor)


### Name: join_rooted_trees
### Title: Join two rooted trees.
### Aliases: join_rooted_trees
### Keywords: joining trees

### ** Examples

# generate two random trees, include tip & node names
tree1 = generate_random_tree(list(birth_rate_intercept=1),
                             max_tips=10,
                             tip_basename="tip1.",
                             node_basename="node1.")$tree
tree2 = generate_random_tree(list(birth_rate_intercept=1),
                             max_tips=5,
                             tip_basename="tip2.",
                             node_basename="node2.")$tree

# join trees at their roots
# each subtree's root should have distance 1 from the new root
joined_tree = join_rooted_trees(tree1, 
                                tree2,
                                target_edge1=0,
                                target_edge_length1=1,
                                root_edge_length2=1)$tree



