library(castor)


### Name: model_adequacy_hbds
### Title: Check if a birth-death-sampling model adequately explains a
###   timetree.
### Aliases: model_adequacy_hbds
### Keywords: HBDS

### ** Examples

## Not run: 
##D # generate a tree based on a simple HBDS process
##D max_time = 10
##D gen = castor::generate_tree_hbds(max_time           = max_time,
##D                                  lambda             = 1,
##D                                  mu                 = 0.1,
##D                                  psi                = 0.1,
##D                                  no_full_extinction = TRUE)
##D if(!gen$success) stop(sprintf("Could not generate tree: %s",gen$error))
##D tree     = gen$tree
##D root_age = castor::get_tree_span(tree)$max_distance
##D 
##D # determine age of the stem, i.e. when the HBDS process started
##D stem_age = gen$root_time + root_age
##D 
##D # determine age at which the HBDS simulation was halted.
##D # This might be slightly negative, e.g. if the process
##D # halted after the last sampled tip
##D end_age = root_age - (gen$final_time-gen$root_time)
##D 
##D # compare the tree to a slightly different model
##D model = list(stem_age    = stem_age,
##D              end_age     = end_age,
##D              lambda      = 1.2,
##D              mu          = 0.1,
##D              psi         = 0.2)
##D adequacy = model_adequacy_hbds( tree, 
##D                                 models = model,
##D                                 Nbootstraps = 100)
##D if(!adequacy$success){
##D     cat(sprintf("Adequacy test failed: %s\n",adequacy$error))
##D }else{
##D     print(adequacy$statistical_tests)
##D }
## End(Not run)



