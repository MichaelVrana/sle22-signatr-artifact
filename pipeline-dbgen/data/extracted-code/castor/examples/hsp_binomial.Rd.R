library(castor)


### Name: hsp_binomial
### Title: Hidden state prediction for a binary trait based on the binomial
###   distribution.
### Aliases: hsp_binomial
### Keywords: ancestral state reconstruction hidden state prediction

### ** Examples
## Not run: 
##D # generate random tree
##D Ntips =50
##D tree = generate_random_tree(list(birth_rate_factor=1),max_tips=Ntips)$tree
##D 
##D # simulate a binary trait on the tips
##D Q = get_random_mk_transition_matrix(Nstates=2, rate_model="ER", min_rate=0.1, max_rate=0.5)
##D tip_states = simulate_mk_model(tree, Q)$tip_states
##D 
##D # print tip states
##D cat(sprintf("True tip states:\n"))
##D print(tip_states)
##D 
##D # hide some of the tip states
##D # include a reveal bias
##D reveal_probs = c(0.8, 0.3)
##D revealed = sapply(1:Ntips, FUN=function(n) rbinom(n=1,size=1,prob=reveal_probs[tip_states[n]]))
##D input_tip_states = tip_states
##D input_tip_states[!revealed] = NA
##D 
##D # predict state probabilities P1 and P2
##D hsp = hsp_binomial(tree, input_tip_states, reveal_probs=reveal_probs, max_STE=0.2)
##D probs = cbind(hsp$P1,1-hsp$P1)
##D 
##D # pick most likely state as a point estimate
##D # only accept point estimate if probability is sufficiently high
##D estimated_tip_states = max.col(probs[1:Ntips,])
##D estimated_tip_states[probs[cbind(1:Ntips,estimated_tip_states)]<0.8] = NA
##D cat(sprintf("ML-predicted tip states:\n"))
##D print(estimated_tip_states)
##D 
##D # calculate fraction of correct predictions
##D predicted = which((!revealed) & (!is.na(estimated_tip_states)))
##D if(length(predicted)>0){
##D   Ncorrect  = sum(tip_states[predicted]==estimated_tip_states[predicted])
##D   cat(sprintf("%.2g%% of predictions are correct\n",(100.0*Ncorrect)/length(predicted)))
##D }else{
##D   cat(sprintf("None of the tip states could be reliably predicted\n"))
##D }
## End(Not run)


