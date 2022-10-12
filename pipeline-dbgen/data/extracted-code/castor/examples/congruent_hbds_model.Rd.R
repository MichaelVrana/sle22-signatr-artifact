library(castor)


### Name: congruent_hbds_model
### Title: Generate a congruent homogenous-birth-death-sampling model.
### Aliases: congruent_hbds_model
### Keywords: tree model simulation birth-death model

### ** Examples

# define an HBDS model with exponentially decreasing speciation/extinction rates
# and constant Poissonian sampling rate psi
oldest_age= 10
age_grid  = seq(from=0,to=oldest_age,by=0.1) # choose a sufficiently fine age grid
lambda    = 1*exp(0.01*age_grid) # define lambda on the age grid
mu        = 0.2*lambda # assume similarly shaped but smaller mu

# simulate deterministic HBD model
# scale LTT such that it is 100 at age 1
sim = simulate_deterministic_hbds(age_grid  = age_grid,
                                  lambda    = lambda,
                                  mu        = mu,
                                  psi       = 0.1,
                                  age0      = 1,
                                  LTT0      = 100)
                                         
# calculate a congruent HBDS model with an alternative sampling rate
# use the previously simulated variables to define the congruence class
new_psi = 0.1*exp(-0.01*sim$ages) # consider a psi decreasing with age
congruent = congruent_hbds_model(age_grid   = sim$ages,
                                 PSR        = sim$PSR,
                                 PDR        = sim$PDR,
                                 lambda_psi = sim$lambda_psi,
                                 psi        = new_psi)
											 
# compare the deterministic LTT of the two models
# to confirm that the models are indeed congruent
if(!congruent$valid){
    cat("WARNING: Congruent model is not biologically valid\n")
}else{
    # simulate the congruent model to get the LTT
    csim = simulate_deterministic_hbds(age_grid = congruent$ages,
                                       lambda   = congruent$lambda,
                                       mu       = congruent$mu,
                                       psi      = congruent$psi,
                                       age0     = 1,
                                       LTT0     = 100)

    # plot deterministic LTT of the original and congruent model
    plot( x = sim$ages, y = sim$LTT, type='l',
          main='dLTT', xlab='age', ylab='lineages', 
          xlim=c(oldest_age,0), col='red')
    lines(x= csim$ages, y=csim$LTT, 
          type='p', pch=21, col='blue')
}



