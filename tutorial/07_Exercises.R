# 07_Exercises.R
# Practice exercises for the BMI101 data visualisation course

# Exercise 1: Reproduce the introduction scatter plot using mtcars
# Exercise 2: Change the colour, labels, and theme in a ggplot
# Exercise 3: Create a boxplot for one numeric variable grouped by a factor
# Exercise 4: Plot a heatmap or PCA result for a small synthetic dataset
# Exercise 5: Create a volcano plot from a simple data frame

# Example starter code:

library(tidyverse)

# Replace this with your own plot

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(colour = "firebrick", size = 3) +
  theme_minimal() +
  labs(title = "Exercise plot", x = "Weight", y = "MPG")
