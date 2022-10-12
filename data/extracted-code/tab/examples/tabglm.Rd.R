library(tab)


### Name: tabglm
### Title: Create Summary Table for Fitted Generalized Linear Model
### Aliases: tabglm

### ** Examples

# Linear regression: BMI vs. age, sex, race, and treatment
fit <- glm(BMI ~ Age + Sex + Race + Group, data = tabdata)
tabglm(fit)

# Can also use piping
fit %>% tabglm()

# Logistic regression: 1-year mortality vs. age, sex, race, and treatment
fit <- glm(
  death_1yr ~ Age + Sex + Race + Group,
  data = tabdata,
  family = binomial
)
fit %>% tabglm()

# Same as previous, but with custom labels for Age and Race and factors
# displayed in slightly more compressed format
fit %>%
  tabglm(
    xvarlabels = list(Age = "Age (years)", Race = "Race/ethnicity"),
    factor.compression = 2
  )

# Logistic regression model with some higher-order terms
fit <- glm(
  death_1yr ~ poly(Age, 2, raw = TRUE) + Sex + BMI + Sex * BMI,
  data = tabdata,
  family = "binomial"
)
fit %>% tabglm()





