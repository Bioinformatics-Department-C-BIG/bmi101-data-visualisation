# ============================================================
# CING MSc Bioinformatics
# Bioinformatics 101
#
# Data Visualisation Tutorial
# ============================================================

library(tidyverse)
library(ggplot2)

# Test R
R.version.string

# Test dataset
head(mtcars)

# Our first ggplot

ggplot(
  mtcars,
  aes(
    x = wt,
    y = mpg
  )
) +
  geom_point(
    size = 3,
    colour = "steelblue"
  ) +
  theme_minimal()
