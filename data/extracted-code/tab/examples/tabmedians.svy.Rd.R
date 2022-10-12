library(tab)


### Name: tabmedians.svy
### Title: Create Table Comparing Group Medians (for Complex Survey Data)
### Aliases: tabmedians.svy

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

# Compare median BMI by sex
(medtable1 <- tabmedians.svy(BMI ~ Sex, design = design))





