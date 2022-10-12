library(tab)


### Name: tabmulti.svy
### Title: Create Table Comparing Characteristics Across Levels of a
###   Categorical Variable (for Complex Survey Data)
### Aliases: tabmulti.svy

### ** Examples

# Create survey design object
library("survey")
design <- svydesign(
  data = tabsvydata,
  ids = ~sdmvpsu,
  strata = ~sdmvstra,
  weights = ~wtmec2yr,
  nest = TRUE
)

# Compare age, race, and BMI by sex
tabmulti.svy(Age + Race + BMI ~ Sex, design)





