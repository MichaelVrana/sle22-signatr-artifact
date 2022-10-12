library(tab)


### Name: tabmeans
### Title: Create Table Comparing Group Means
### Aliases: tabmeans

### ** Examples

# Compare mean BMI in control vs. treatment group in sample dataset
(meanstable1 <- tabmeans(BMI ~ Group, data = tabdata))

# Compare mean baseline systolic BP across tertiles of BMI
(meanstable2 <- tabmeans(bp.1 ~ BMI, data = tabdata,
                         quantiles = 3, yname = "Systolic BP"))




