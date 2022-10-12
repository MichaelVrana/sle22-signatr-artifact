library(castor)


### Name: simulate_dsse
### Title: Simulate a Discrete-State Speciation and Extinction (dSSE)
###   model.
### Aliases: simulate_dsse simulate_musse
### Keywords: random tree model simulation MuSSE BiSSE

### ** Examples

# Simulate a tree under a classical BiSSE model
# I.e., anagenetic transitions between two states, no Poissonian sampling through time.
A = get_random_mk_transition_matrix(Nstates=2, rate_model="ER", max_rate=0.1)
parameters = list(birth_rates         = c(1,1.5),
                  death_rates         = 0.5,
                  transition_matrix_A = A)
simulation = simulate_dsse( Nstates         = 2, 
                            parameters      = parameters, 
                            max_extant_tips = 1000, 
                            include_rates   = TRUE)
tree       = simulation$tree
Ntips      = length(tree$tip.label)

# plot distribution of per-capita birth rates of tips
rates = simulation$clade_birth_rates[1:Ntips]
barplot(table(rates)/length(rates), 
        xlab="rate", 
        main="Distribution of pc birth rates across tips (BiSSE model)")



