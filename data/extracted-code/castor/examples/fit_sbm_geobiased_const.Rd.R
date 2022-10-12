library(castor)


### Name: fit_sbm_geobiased_const
### Title: Fit a phylogeographic Spherical Brownian Motion model with
###   geographic sampling bias.
### Aliases: fit_sbm_geobiased_const
### Keywords: SBM model random fitting simulation

### ** Examples

## Not run: 
##D NFullTips   = 10000
##D diffusivity = 1
##D radius      = 6371
##D 
##D # generate tree and run SBM on it
##D cat(sprintf("Generating tree and simulating SBM (true D=%g)..\n",diffusivity))
##D tree = castor::generate_tree_hbd_reverse(Ntips  = NFullTips,
##D                                          lambda = 5e-7,
##D                                          mu     = 2e-7,
##D                                          rho    = 1)$trees[[1]]
##D SBMsim = simulate_sbm(tree = tree, radius = radius, diffusivity = diffusivity)
##D 
##D # select subset of tips only found in certain geographic regions
##D min_abs_lat = 30
##D max_abs_lat = 80
##D min_lon     = 0
##D max_lon     = 90
##D keep_tips   = which((abs(SBMsim$tip_latitudes)<=max_abs_lat)
##D                     & (abs(SBMsim$tip_latitudes)>=min_abs_lat)
##D                     & (SBMsim$tip_longitudes<=max_lon)
##D                     & (SBMsim$tip_longitudes>=min_lon))
##D rarefaction     = castor::get_subtree_with_tips(tree, only_tips = keep_tips)
##D tree            = rarefaction$subtree
##D tip_latitudes   = SBMsim$tip_latitudes[rarefaction$new2old_tip]
##D tip_longitudes  = SBMsim$tip_longitudes[rarefaction$new2old_tip]
##D Ntips           = length(tree$tip.label)
##D rarefaction     = Ntips/NFullTips
##D 
##D # fit SBM while correcting for geographic sampling biases
##D fit = castor:::fit_sbm_geobiased_const(trees            = tree,
##D                                        tip_latitudes    = tip_latitudes,
##D                                        tip_longitudes   = tip_longitudes,
##D                                        radius           = radius,
##D                                        rarefaction      = Ntips/NFullTips,
##D                                        Nsims            = 10,
##D                                        Nthreads         = 4,
##D                                        verbose          = TRUE,
##D                                        verbose_prefix   = "  ")
##D if(!fit$success){
##D     cat(sprintf("ERROR: %s\n",fit$error))
##D }else{
##D     cat(sprintf("Estimated true D = %g\n",fit$diffusivity))
##D }
## End(Not run)



