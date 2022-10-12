library(castor)


### Name: generate_tree_hbds
### Title: Generate a tree from a birth-death-sampling model in forward
###   time.
### Aliases: generate_tree_hbds
### Keywords: tree model simulation birth-death-sampling model

### ** Examples

# define time grid on which lambda, mu and psi will be specified
time_grid = seq(0,100,length.out=1000)

# specify the time-dependent extinction rate mu on the time-grid
mu_grid = 0.5*time_grid/(10+time_grid)

# define additional concentrated sampling attempts
CSA_times  = c(5,7,9)
CSA_probs  = c(0.5, 0.5, 0.5)
CSA_kappas = c(0.2, 0.1, 0.1)

# generate tree with a constant speciation & sampling rate,
# time-variable extinction rate and additional discrete sampling points
# assuming that all continuously sampled lineages are removed from the pool
simul = generate_tree_hbds( max_time        = 10,
                            include_extant  = FALSE,
                            include_extinct = FALSE,
                            time_grid       = time_grid,
                            lambda          = 1,
                            mu              = mu_grid,
                            psi             = 0.1,
                            kappa           = 0,
                            CSA_times       = CSA_times,
                            CSA_probs       = CSA_probs,
                            CSA_kappas      = CSA_kappas);
if(!simul$success){
    cat(sprintf("ERROR: Could not simulate tree: %s\n",simul$error))
}else{
    # simulation succeeded. print some basic info about the generated tree
    tree = simul$tree
    cat(sprintf("Generated tree has %d tips\n",length(tree$tip.label)))
}



