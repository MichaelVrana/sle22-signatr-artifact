library(tab)


### Name: glm_v
### Title: Print a GLM Summary Table to the RStudio Viewer
### Aliases: glm_v

### ** Examples

# Fit and view
glm_v(death_1yr ~ Age + Sex + Race, data = tabdata, family = "binomial")

# Fit then view
fit <- glm(death_1yr ~ Age + Sex + Race, data = tabdata, family = "binomial")
glm_v(fit)

# Piping is OMG so cool Hashtag HexStickerz
fit %>% glm_v()




