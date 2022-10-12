library(castor)


### Name: simulate_tdsse
### Title: Simulate a time-dependent Discrete-State Speciation and
###   Extinction (tdSSE) model.
### Aliases: simulate_tdsse
### Keywords: random tree model simulation MuSSE BiSSE

### ** Examples
## Not run: 
##D # prepare params for time-dependent BiSSE model
##D # include time-dependent speciation & extinction rates
##D # as well as time-dependent anagenetic transition rates
##D Nstates          = 2
##D reveal_fractions = c(1,0.5)
##D rarefaction      = 0.5 # species sampling fraction
##D 
##D time2lambda1 = function(times) rep(1,times=length(times))
##D time2lambda2 = function(times) rep(2,times=length(times))
##D time2mu1     = function(times) 0.5 + 2.5*exp(-((times-8)**2)/2)
##D time2mu2     = function(times) 1 + 2*exp(-((times-12)**2)/2)
##D time_grid    = seq(from=0, to=100, length.out=1000)
##D 
##D time2Q12    = function(times) 1*exp(0.1*times)
##D time2Q21    = function(times) 2*exp(-0.1*times)
##D QA          = array(0, dim=c(Nstates,Nstates,length(time_grid)))
##D QA[1,2,]    = time2Q12(time_grid)
##D QA[2,1,]    = time2Q21(time_grid)
##D QA[1,1,]    = -QA[1,2,]
##D QA[2,2,]    = -QA[2,1,]
##D 
##D parameters = list()
##D parameters$birth_rates = rbind(time2lambda1(time_grid), time2lambda2(time_grid))
##D parameters$death_rates = rbind(time2mu1(time_grid), time2mu2(time_grid))
##D parameters$transition_matrix_A = QA
##D 
##D # simulate time-dependent BiSSE model
##D cat(sprintf("Simulating tMuSSE model..\n"))
##D sim = castor::simulate_tdsse(Nstates            = Nstates,
##D                             time_grid           = time_grid,
##D                             parameters          = parameters, 
##D                             splines_degree      = 1,
##D                             max_tips            = 10000/rarefaction,
##D                             sampling_fractions  = rarefaction,
##D                             reveal_fractions    = reveal_fractions,
##D                             coalescent          = TRUE,
##D                             no_full_extinction  = TRUE)
##D if(!sim$success){
##D     cat(sprintf("ERROR: %s\n",sim$error))
##D }else{
##D     # print some summary info about the generated tree
##D     tree        = sim$tree
##D     Ntips       = length(tree$tip.label)
##D     root_age    = get_tree_span(tree)$max_distance
##D     root_time   = sim$final_time - root_age
##D     tip_states  = sim$tip_states
##D     Nknown_tips = sum(!is.na(tip_states))
##D     cat(sprintf("Note: Simulated tree has root_age = %g\n",root_age))
##D     cat(sprintf("Note: %d tips have known state\n", Nknown_tips));
##D }
## End(Not run)


