library(tab)


### Name: tabfreq.svy
### Title: Create Frequency Table (for Complex Survey Data)
### Aliases: tabfreq.svy

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

# Compare race distribution by sex
tabfreq.svy(Race ~ Sex, design)





