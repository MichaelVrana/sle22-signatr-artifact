library(castor)


### Name: generate_gene_tree_msc
### Title: Generate a gene tree based on the multi-species coalescent
###   model.
### Aliases: generate_gene_tree_msc
### Keywords: random tree model simulation gene tree

### ** Examples

# Simulate a simple species tree
parameters   = list(birth_rate_factor=1)
Nspecies     = 10
species_tree = generate_random_tree(parameters,max_tips=Nspecies)$tree

# Simulate a haploid gene tree within the species tree
# Assume the same population size and generation time everywhere
# Assume the number of alleles samples per species is poisson-distributed
results = generate_gene_tree_msc(species_tree, 
                                 allele_counts      = rpois(Nspecies,3),
                                 population_sizes   = 1000,
                                 generation_times   = 1,
                                 ploidy             = 1);
if(!results$success){
    # simulation failed
    cat(sprintf("  ERROR: %s\n",results$error))
}else{
    # simulation succeeded
    gene_tree = results$tree
    cat(sprintf("  Gene tree has %d tips\n",length(gene_tree$tip.label)))
}



