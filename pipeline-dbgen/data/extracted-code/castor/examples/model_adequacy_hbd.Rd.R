library(castor)


### Name: model_adequacy_hbd
### Title: Check if a birth-death model adequately explains a timetree.
### Aliases: model_adequacy_hbd

### ** Examples

# generate a tree
tree = castor::generate_tree_hbd_reverse(Ntips  = 50,
                                         lambda = 1,
                                         mu     = 0.5,
                                         rho    = 1)$trees[[1]]
root_age = castor::get_tree_span(tree)$max_distance

# define & simulate a somewhat different BD model
model = simulate_deterministic_hbd(LTT0         = 50,
                                   oldest_age   = root_age,
                                   lambda       = 1.5,
                                   mu           = 0.5,
                                   rho0         = 1)

# compare the tree to the model
adequacy = model_adequacy_hbd(tree, 
                              models        = model,
                              Nbootstraps   = 100,
                              Nthreads      = 2)
if(!adequacy$success){
    cat(sprintf("Adequacy test failed: %s\n",adequacy$error))
}else{
    print(adequacy$statistical_tests)
}



