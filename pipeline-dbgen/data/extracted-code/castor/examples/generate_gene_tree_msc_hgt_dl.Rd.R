library(castor)


### Name: generate_gene_tree_msc_hgt_dl
### Title: Generate gene trees based on the multi-species coalescent,
###   horizontal gene transfers and duplications/losses.
### Aliases: generate_gene_tree_msc_hgt_dl
### Keywords: random tree model simulation gene tree

### ** Examples

# Simulate a simple species tree
parameters   = list(birth_rate_factor=1)
Nspecies     = 10
species_tree = generate_random_tree(parameters,max_tips=Nspecies)$tree

# Simulate a haploid gene tree within the species tree, including HGTs and gene loss
# Assume the same population size and generation time everywhere
# Assume the number of alleles samples per species is poisson-distributed
results = generate_gene_tree_msc_hgt_dl(species_tree, 
                                        allele_counts      = rpois(Nspecies,3),
                                        population_sizes   = 1000,
                                        generation_times   = 1,
                                        ploidy             = 1,
                                        HGT_rates          = 0.1,
                                        loss_rates         = 0.05);
if(!results$success){
    # simulation failed
    cat(sprintf("  ERROR: %s\n",results$error))
}else{
    # simulation succeeded
    gene_tree = results$gene_tree
    cat(sprintf("  Gene tree has %d tips\n",length(gene_tree$tip.label)))
}



