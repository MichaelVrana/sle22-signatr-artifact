library(tab)


### Name: tabmeans.svy
### Title: Create Table Comparing Group Means (for Complex Survey Data)
### Aliases: tabmeans.svy

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

# Compare mean BMI by sex
(meanstable <- tabmeans.svy(BMI ~ Sex, design = design))





