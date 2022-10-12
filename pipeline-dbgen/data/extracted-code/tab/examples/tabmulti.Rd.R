library(tab)


### Name: tabmulti
### Title: Create Table Comparing Characteristics Across Levels of a
###   Categorical Variable
### Aliases: tabmulti

### ** Examples

# Compare age, sex, race, and BMI in control vs. treatment group
tabmulti(Age + Sex + Race + BMI ~ Group, data = tabdata)

# Same as previous, but compare medians rather than means for BMI
tabmulti(Age + Sex + Race + BMI ~ Group, data = tabdata,
         ymeasures = c("mean", "freq", "freq", "median"))





