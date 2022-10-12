library(tab)


### Name: tabgee
### Title: Create Summary Table for Fitted Generalized Estimating Equation
###   Model
### Aliases: tabgee

### ** Examples

# Load in sample dataset and convert to long format
tabdata2 <- reshape(data = tabdata,
                    varying = c("bp.1", "bp.2", "bp.3", "highbp.1",
                                "highbp.2", "highbp.3"),
                    timevar = "bp.visit", direction = "long")
tabdata2 <- tabdata2[order(tabdata2$id), ]

# Blood pressure at 1, 2, and 3 months vs. age, sex, race, and treatment
library("gee")
fit <- gee(bp ~ Age + Sex + Race + Group, id = id, data = tabdata2,
           corstr = "unstructured")
tabgee(fit)

# Can also use piping
fit %>% tabgee(data = tabdata2)

# Same as previous, but with custom labels for Age and Race and factors
# displayed in slightly more compressed format
fit %>%
  tabgee(
    data = tabdata2,
    var.labels = list(Age = "Age (years)", Race = "Race/ethnicity"),
    factor.compression = 2
  )

# GEE with some higher-order terms
# higher-order terms
fit <- gee(
  highbp ~ poly(Age, 2, raw = TRUE) + Sex + Race + Group + Race*Group,
  id = id,
  data = tabdata2,
  family = "binomial",
  corstr = "unstructured"
)
fit %>% tabgee(data = tabdata2)





