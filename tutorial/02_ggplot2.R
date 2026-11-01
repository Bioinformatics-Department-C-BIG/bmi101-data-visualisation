library(tidyverse)
library(ggplot2)

# 02_ggplot2.R
# Building on the basic ggplot grammar

# Example: plot mpg vs wt and colour by number of cylinders

ggplot(
  mtcars,
  aes(
    x = wt,
    y = mpg,
    colour = factor(cyl)
  )
) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Miles per gallon vs weight",
    x = "Weight",
    y = "MPG",
    colour = "Cylinders"
  ) +
  theme_minimal()
