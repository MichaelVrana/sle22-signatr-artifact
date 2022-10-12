library(castor)


### Name: geographic_acf
### Title: Phylogenetic autocorrelation function of geographic locations.
### Aliases: geographic_acf
### Keywords: trait evolution

### ** Examples

# generate a random tree
tree = generate_random_tree(list(birth_rate_intercept=1),max_tips=1000)$tree

# simulate spherical Brownian Motion on the tree
simul = simulate_sbm(tree, radius=1, diffusivity=0.1)
tip_latitudes  = simul$tip_latitudes
tip_longitudes = simul$tip_longitudes

# calculate geographical autocorrelation function
ACF = geographic_acf(tree, tip_latitudes, tip_longitudes, Nbins=10)

# plot ACF (autocorrelation vs phylogenetic distance)
plot(ACF$phylodistances, ACF$autocorrelations, type="l", xlab="distance", ylab="ACF")



