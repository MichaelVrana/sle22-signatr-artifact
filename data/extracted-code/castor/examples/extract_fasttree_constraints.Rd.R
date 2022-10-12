library(castor)


### Name: extract_fasttree_constraints
### Title: Extract tree constraints in FastTree alignment format.
### Aliases: extract_fasttree_constraints

### ** Examples

# generate a simple rooted tree, with tip names tip.1, tip.2, ...
Ntips = 10
tree  = generate_random_tree(list(birth_rate_intercept=1),
                             max_tips=Ntips,
                             tip_basename="tip.")$tree

# extract constraints
constraints = castor::extract_fasttree_constraints(tree)$constraints

# print constraints to screen in fasta format
cat(paste(sapply(1:Ntips, 
    FUN=function(tip) sprintf(">%s\n%s\n",tree$tip.label[tip],
    paste(as.character(constraints[tip,]),collapse=""))),collapse=""))



