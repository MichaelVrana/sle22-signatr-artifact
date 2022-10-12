library(tab)


### Name: tabmedians
### Title: Create Table Comparing Group Medians
### Aliases: tabmedians

### ** Examples

# Compare median BMI in control group vs. treatment group in sample dataset
(medtable1 <- tabmedians(BMI ~ Group, data = tabdata))

# Compare median baseline systolic BP across tertiles of BMI
(medtable2 <- tabmedians(bp.1 ~ BMI, data = tabdata,
                         quantiles = 3, yname = "Systolic BP"))





