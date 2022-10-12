library(castor)


### Name: generate_tree_hbd_reverse
### Title: Generate a tree from a birth-death model in reverse time.
### Aliases: generate_tree_hbd_reverse
### Keywords: tree model simulation birth-death model

### ** Examples

# EXAMPLE 1: Generate trees based on some speciation and extinction rate
# In this example we assume an exponentially decreasing speciation rate
#   and a temporary mass extinction event

# define parameters
age_grid = seq(0,100,length.out=1000)
lambda   = 0.1 + exp(-0.5*age_grid)
mu       = 0.05 + exp(-(age_grid-5)^2)
rho      = 0.5 # species sampling fraction at present-day

# generate a tree with 100 tips and no specific crown or stem age
sim = generate_tree_hbd_reverse(Ntips       = 100, 
                                age_grid    = age_grid, 
                                lambda      = lambda,
                                mu          = mu,
                                rho         = rho)
if(!sim$success){
    cat(sprintf("Tree generation failed: %s\n",sim$error))
}else{
    cat(sprintf("Tree generation succeeded\n"))
    tree = sim$trees[[1]]
}


########################
# EXAMPLE 2: Generate trees based on the pulled speciation rate
# Here we condition the tree on some fixed crown (MRCA) age

# specify the PSR on a sufficiently fine and wide age grid
age_grid  = seq(0,1000,length.out=10000)
PSR       = 0.1+exp(-0.1*age_grid) # exponentially decreasing PSR

# generate a tree with 100 tips and MRCA age 10
sim = generate_tree_hbd_reverse(Ntips       = 100, 
                                age_grid    = age_grid, 
                                PSR         = PSR, 
                                crown_age   = 10)
if(!sim$success){
    cat(sprintf("Tree generation failed: %s\n",sim$error))
}else{
    cat(sprintf("Tree generation succeeded\n"))
    tree = sim$trees[[1]]
}



