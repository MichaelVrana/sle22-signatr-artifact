library(dplyr)


### Name: across
### Title: Apply a function (or functions) across multiple columns
### Aliases: across if_any if_all

### ** Examples

# across() -----------------------------------------------------------------
# Different ways to select the same set of columns
# See <https://tidyselect.r-lib.org/articles/syntax.html> for details
iris %>%
  as_tibble() %>%
  mutate(across(c(Sepal.Length, Sepal.Width), round))
iris %>%
  as_tibble() %>%
  mutate(across(c(1, 2), round))
iris %>%
  as_tibble() %>%
  mutate(across(1:Sepal.Width, round))
iris %>%
  as_tibble() %>%
  mutate(across(where(is.double) & !c(Petal.Length, Petal.Width), round))

# A purrr-style formula
iris %>%
  group_by(Species) %>%
  summarise(across(starts_with("Sepal"), ~ mean(.x, na.rm = TRUE)))

# A named list of functions
iris %>%
  group_by(Species) %>%
  summarise(across(starts_with("Sepal"), list(mean = mean, sd = sd)))

# Use the .names argument to control the output names
iris %>%
  group_by(Species) %>%
  summarise(across(starts_with("Sepal"), mean, .names = "mean_{.col}"))
iris %>%
  group_by(Species) %>%
  summarise(across(starts_with("Sepal"), list(mean = mean, sd = sd), .names = "{.col}.{.fn}"))

# When the list is not named, .fn is replaced by the function's position
iris %>%
  group_by(Species) %>%
  summarise(across(starts_with("Sepal"), list(mean, sd), .names = "{.col}.fn{.fn}"))

# if_any() and if_all() ----------------------------------------------------
iris %>%
  filter(if_any(ends_with("Width"), ~ . > 4))
iris %>%
  filter(if_all(ends_with("Width"), ~ . > 2))




