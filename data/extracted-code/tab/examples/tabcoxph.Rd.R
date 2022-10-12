library(tab)


### Name: tabcoxph
### Title: Create Summary Table for Fitted Cox Proportional Hazards Model
### Aliases: tabcoxph

### ** Examples

# Cox PH model with age, sex, race, and treatment
library("survival")
fit <- coxph(
  Surv(time = time, event = delta) ~ Age + Sex + Race + Group,
  data = tabdata
)
tabcoxph(fit)

# Can also use piping
fit %>% tabcoxph()

# Same as previous, but with custom labels for Age and Race and factors
# displayed in slightly more compressed format
fit %>%
  tabcoxph(
    var.labels = list(Age = "Age (years)", Race = "Race/ethnicity"),
    factor.compression = 2
  )

# Cox PH model with some higher-order terms
fit <- coxph(
  Surv(time = time, event = delta) ~
  poly(Age, 2, raw = TRUE) + Sex + Race + Group + Race*Group,
  data = tabdata
)
fit %>% tabcoxph()





