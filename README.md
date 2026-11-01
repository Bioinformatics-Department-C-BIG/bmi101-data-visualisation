# BMI101 Data Visualisation Tutorial

This repository contains a short R-based data visualisation tutorial for the CING MSc Bioinformatics module.

## Setup

```bash
Rscript install.R
```

## Included tutorials

- `tutorial/01_Introduction.R` - first ggplot example using mtcars
- `tutorial/02_ggplot2.R` - ggplot customisation and grouping
- `tutorial/03_Gene_Expression.R` - gene expression plotting ideas
- `tutorial/04_PCA.R` - dimensionality reduction visualisation
- `tutorial/05_Heatmaps.R` - clustering heatmaps
- `tutorial/06_Volcano_Plot.R` - differential expression volcano plots
- `tutorial/07_Exercises.R` - practice exercises

## Introduction example

```R
library(tidyverse)
library(ggplot2)

R.version.string
head(mtcars)

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
```

Place any raw datasets in the `data/` folder before running the later tutorials.
