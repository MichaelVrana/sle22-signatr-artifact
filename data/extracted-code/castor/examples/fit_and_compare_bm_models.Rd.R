library(castor)


### Name: fit_and_compare_bm_models
### Title: Fit and compare Brownian Motion models for multivariate trait
###   evolution between two data sets.
### Aliases: fit_and_compare_bm_models
### Keywords: BM model

### ** Examples

# simulate distinct BM models on two random trees
D1 = 1
D2 = 2
tree1 = generate_random_tree(list(birth_rate_factor=1),max_tips=100)$tree
tree2 = generate_random_tree(list(birth_rate_factor=1),max_tips=100)$tree
tip_states1 = simulate_bm_model(tree1, diffusivity = D1)$tip_states
tip_states2 = simulate_bm_model(tree2, diffusivity = D2)$tip_states

# fit and compare BM models between the two data sets
fit = fit_and_compare_bm_models(trees1          = tree1, 
                                tip_states1     = tip_states1, 
                                trees2          = tree2,
                                tip_states2     = tip_states2,
                                Nbootstraps     = 100,
                                Nsignificance   = 100)

# print summary of results
cat(sprintf("Fitted D1 = %g, D2 = %g, significance of log-diff. = %g\n",
            fit$fit1$diffusivity, fit$fit2$diffusivity, fit$significance))



